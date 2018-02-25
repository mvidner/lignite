#!/usr/bin/ruby
# coding: utf-8
# https://www.lego.com/mindstorms/build-a-robot/bobb3e
# A Bobcat® like two-tracked forklift

require "lignite"

class Bobbee
  # @return [Lignite::Motors]
  attr :drive
  # @return [Lignite::Motors]
  attr :lift
  attr :dc

  def initialize(drive: Lignite::PORT_B | Lignite::PORT_C,
                 lift: Lignite::PORT_A,
                 dc: Lignite::DirectCommands.new)
    layer = 0
    @drive = Lignite::Motors.new(layer, drive, dc)
    @lift = Lignite::Motors.new(layer, lift, dc)
    @dc = dc
  end

  # @param turn [Integer] -200..200
  def time_sync(speed, turn, ms, brake = Lignite::BRAKE, wait: true)
    # 1500 ms is about 1 boost square at speed 100
    drive.time_sync(-speed, turn, ms, brake)
  end

  # @param turn [Integer] -200..200
  def step_sync(speed, turn, degrees, brake = Lignite::BRAKE, wait: true)
    # turn 0 (straight)
    # -  900 (2.5 * 360) degrees is about 1 boost square
    # turn 200 (full right)
    # -  2400 degrees is a full turn, 600 deg is an about-right turn
    #    where the center of rotation is the battery-cover of the brick,
    #    or between the rear axles.
    # turn 100 (semi right)
    # - 4800 degrees is a full turn, about one of the rear axles
    drive.step_sync(-speed, turn, degrees, brake)
    drive.ready if wait
  end

  LIFT_FULL = 220

  def raise(wait: true)
    lift.step_power(30, 10, LIFT_FULL - 20, 10)
    lift.ready if wait
  end

  def third_raise(wait: true)
    lift.step_power(30, 10, LIFT_FULL/3 - 20, 10)
    lift.ready if wait

    beep
    sleep 3
  end

  def lower(wait: true)
    lift.step_power(-1, 10, LIFT_FULL - 20, 10) #, Lignite::COAST)
    lift.ready if wait

    beep
    sleep 3
  end

  def third_lower(wait: true)
    lift.step_power(-1, 10, LIFT_FULL/3 - 20, 10)
    lift.ready if wait
  end

  def beep(ms = 300)
    dc.sound_tone(20, 1760, ms)
    dc.sound_ready
  end

  SQUARE_STEPS = 920
  def f(steps = SQUARE_STEPS)
    step_sync(50, 0, steps)
    beep
    sleep 3
  end

  def b(steps = SQUARE_STEPS)
    step_sync(-50, 0, back_factor(steps))
    beep
    sleep 3
  end

  # it moves faster when going backwards!?
  def back_factor(n)
    (n * 0.95).to_i
  end

  ROTATION_OFFSET = 350
  def f1
    f(ROTATION_OFFSET)
    beep(100)
  end

  TURN_90_AT_200_STEPS = 600
  def l2
    step_sync(50, -200, TURN_90_AT_200_STEPS)
    beep(100)
    sleep 3
  end

  def r2
    step_sync(50, 200, TURN_90_AT_200_STEPS)
    beep(100)
    sleep 3
  end

  def f3
    b(ROTATION_OFFSET)
    beep(100)
  end

  def l
    # a 3 part maneuver: forward, left, and back-a-little
    # to turn 1 BS left
    f1
    l2
    f3
  end

  def r
    # a 3 part maneuver: forward, right, and back-a-little
    # to turn 1 BS right
    f1
    r2
    f3
  end
end

bb = Bobbee.new
# 1 BS
# bb.time_sync(100, 0, 1500)

# Put Bobb3e on the blue arrow. Move it one square left, and forward.
# Put the container on a raised platform on the "twins" square.
# Put a raised platform on the "fire" square
def from_twins_to_fire(bb)
  bb.instance_exec do
    beep

    third_raise
    third_raise
    r
    f
    third_raise
    b
    l
    # we're at the starting position, but carrying the load

    # move towards the recipient
    f; f; r

    # deliver and unload
    f
    third_lower
    b

    # resting position
    l; b; b
    third_lower
    third_lower
  end
end

def from_fire_to_twins(bb)
  bb.instance_exec do
    beep

    third_raise
    third_raise

    # move towards the load
    f; f; r

    # load
    f
    third_raise
    b

    # starting position
    l; b; b

    # deliver
    r
    f
    third_lower
    b
    l

    # resting position
    third_lower
    third_lower
  end
end

def calibrate_forward_and_back(bb)
  bb.instance_exec do
    f; f; f; f
    b; b; b; b
  end
end

# calibrate_forward_and_back(bb)
from_twins_to_fire(bb)
# from_fire_to_twins(bb)
