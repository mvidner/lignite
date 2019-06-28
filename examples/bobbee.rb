#!/usr/bin/ruby
# typed: false
require "lignite"

# A Bobcat like two-tracked forklift.
# https://www.lego.com/mindstorms/build-a-robot/bobb3e
class Bobbee
  # The pair of motors driving the tracks
  # @return [Lignite::Motors]
  attr_reader :drive
  # The motor lifting the fork
  # @return [Lignite::Motors]
  attr_reader :lift
  # Interface to all other commands
  # @return [Lignite::DirectCommands]
  attr_reader :dc
  # The robot is built with a https://en.wikipedia.org/wiki/Worm_drive
  # lift mechanism
  # @return [Boolean]
  attr_reader :worm_lift

  def initialize(drive: Lignite::PORT_B | Lignite::PORT_C,
                 lift: Lignite::PORT_A,
                 dc: Lignite::DirectCommands.new,
                 worm_lift: false)
    layer = 0
    @drive = Lignite::Motors.new(layer, drive, dc)
    @lift = Lignite::Motors.new(layer, lift, dc)
    @dc = dc
    @worm_lift = worm_lift
  end

  # @param speed [Integer] -100..100
  # @param turn [Integer] -200..200
  #   turn 0 (straight)
  #   -  900 (2.5 * 360) degrees is about 1 boost square
  #   turn 200 (full right)
  #   -  2400 degrees is a full turn, 600 deg is an about-right turn
  #      where the center of rotation is the battery-cover of the brick,
  #      or between the rear axles.
  #   turn 100 (semi right)
  #   - 4800 degrees is a full turn, about one of the rear axles
  # @param degrees [Integer] degrees to turn the motors
  #   (complicated by gears and *turn*, which see)
  # @param brake [BRAKE,COAST]
  # @param wait [Boolean] work around my ignorance of motor readiness
  def step_sync(speed, turn, degrees, brake = Lignite::BRAKE, wait: true)
    drive.step_sync(-speed, turn, degrees, brake)
    drive.ready if wait
  end

  LIFT_FULL = 220
  WORM_LIFT_FULL = 2400

  # Raise the fork from the ground up
  def raise(wait: true)
    if worm_lift
      lift.step_power(-30, 10, WORM_LIFT_FULL - 20, 10)
    else
      lift.step_power(30, 10, LIFT_FULL - 20, 10)
    end
    lift.ready if wait
  end

  # Raise the fork one third of the way from the ground up
  def third_raise(wait: true)
    if worm_lift
      lift.step_power(-30, 10, WORM_LIFT_FULL / 3 - 20, 10)
    else
      lift.step_power(30, 10, LIFT_FULL / 3 - 20, 10)
    end
    lift.ready if wait

    beep
    ready
  end

  # Lower the fork from above to the ground
  def lower(wait: true)
    if worm_lift
      lift.step_power(30, 10, WORM_LIFT_FULL - 20, 10)
    else
      lift.step_power(-1, 10, LIFT_FULL - 20, 10)
    end
    lift.ready if wait

    beep
    ready
  end

  # Lower the fork one third of the way from above to the ground
  def third_lower(wait: true)
    if worm_lift
      lift.step_power(30, 10, WORM_LIFT_FULL / 3 - 20, 10)
    else
      lift.step_power(-1, 10, LIFT_FULL / 3 - 20, 10)
    end
    lift.ready if wait
  end

  # Beep
  def beep(ms = 300)
    dc.sound_tone(20, 1760, ms)
    dc.sound_ready
  end

  # steps to move 1 square on the Boost mat
  SQUARE_STEPS = 920

  # Drive forward 1 square on the Boost mat
  def forward(steps = SQUARE_STEPS)
    step_sync(50, 0, steps)
    beep
    ready
  end

  # Drive backward 1 square on the Boost mat
  def back(steps = SQUARE_STEPS)
    step_sync(-50, 0, back_factor(steps))
    beep
    ready
  end

  # Compensation factor when moving backward
  def back_factor(n)
    # why? maybe the center of mass affects it
    (n * 0.95).to_i
  end

  # If we want to turn inside a Boost mat square,
  # we cannot simply make a turn since the center of rotation of the robot
  # is between the rear axles which is not in the center of the square.
  # So we need to move forward a bit, turn, and move back the same amount.
  ROTATION_OFFSET = 350

  def align_centers_for_turning(&turn_block)
    forward(ROTATION_OFFSET)
    beep(100)

    turn_block.call

    back(ROTATION_OFFSET)
    beep(100)
  end

  # Motor degrees needed to turn the robot 90 degrees when using turn=200
  TURN_90_AT_200_STEPS = 600
  # Similar, but when we're carrying 100 grams, turning becomes harder!
  LOADED_TURN_90_AT_200_STEPS = 750

  # Turn 90 degrees left, simply by moving tracks in opposite directions
  def left_immediate(loaded: false)
    steps = loaded ? LOADED_TURN_90_AT_200_STEPS : TURN_90_AT_200_STEPS
    step_sync(50, -200, steps)
    beep(100)
    ready
  end

  # Turn 90 degrees right, simply by moving tracks in opposite directions
  def right_immediate(loaded: false)
    steps = loaded ? LOADED_TURN_90_AT_200_STEPS : TURN_90_AT_200_STEPS
    step_sync(50, 200, steps)
    beep(100)
    ready
  end

  # Turn 90 degrees left, starting and ending inside a Boost mat square
  def left(loaded: false)
    align_centers_for_turning do
      left_immediate(loaded: loaded)
    end
  end

  # Turn 90 degrees right, starting and ending inside a Boost mat square
  def right(loaded: false)
    align_centers_for_turning do
      right_immediate(loaded: loaded)
    end
  end

  # Wait until the previous motor movements are complete
  def ready
    return unless @dc.is_a? Lignite::DirectCommands

    print "Ready... "
    drive.test
    lift.test
    puts "OK"
  end
end

# Put Bobb3e (B) on the blue arrow (^). Move it one square left, and forward.
# Put the container on a raised platform on the "twins" square (T).
# Put a raised platform on the "fire" square (F).
#
#     ..F
#     ...
#     B.T
#     .^.
def from_twins_to_fire(bb)
  bb.instance_exec do
    beep

    2.times { third_raise }

    right
    forward
    2.times { third_raise }
    back
    left(loaded: true)
    # we're at the starting position, but carrying the load

    # move towards the recipient
    2.times { forward }
    right(loaded: true)

    # deliver and unload
    forward
    2.times { third_lower }
    back

    # resting position
    left
    2.times { back }
    2.times { third_lower }
  end
end

def from_fire_to_twins(bb)
  bb.instance_exec do
    beep

    2.times { third_raise }

    # move towards the load
    2.times { forward }
    right

    # load
    forward
    2.times { third_raise }
    back

    # starting position
    left(loaded: true)
    2.times { back }

    # deliver
    right(loaded: true)
    forward
    2.times { third_lower }
    back
    left

    # resting position
    2.times { third_lower }
  end
end

def calibrate_forward_and_back(bb)
  bb.instance_exec do
    4.times { forward }
    4.times { back }
  end
end

mode = ARGV.first || "direct"
dc = if mode == "rbf"
  Lignite::SimpleAssembler.new
else
  Lignite::DirectCommands.new
end

bb = Bobbee.new(dc: dc, worm_lift: true)

# calibrate_forward_and_back(bb)
from_twins_to_fire(bb)
# from_fire_to_twins(bb)

dc.write("bobbee.rbf") if mode == "rbf"
