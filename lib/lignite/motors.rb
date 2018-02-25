module Lignite
  # Send {DirectCommands} to motors.
  # It's called Motors instead of Motor because some methods are designed
  # to work on a pair if motors driving a vehicle.
  class Motors
    # do the DCs spawn independent threads??
    # must run ready in the same block?

    attr :layer
    attr :nos
    # @return [Lignite::DirectCommands]
    attr :dc

    def initialize(layer, nos, dc = Lignite::DirectCommands.new)
      @layer = layer
      @nos = nos
      @dc = dc
    end

    # TODO filter out support: official: no

    # the type is an OUT param so the VM SETs and we GET to learn the type?
    def set_type
      nos.map do |no|
        dc.output_set_type(layer, no)
      end
    end

    # TODO: direct commands can do outputs? not yet

    # ATTR tacho, like degrees
    def reset
      dc.output_reset(lay, nos) # tacho counts
    end

    # ATTR running
    def stop(brake = Lignite::BRAKE)
      dc.output_stop(layer, nos, brake)
    end

    # ATTR power ~ speed ?
    def power(power)
      dc.output_power(layer, nos, power) # does this start them also?
    end

    def speed(speed)
      dc.output_speed(layer, nos, speed) # does this start them also?
    end

    def start
      dc.output_start(layer, nos)   # apparently not
    end

    # ATTR ~polarity
    def polarity(pol)
      dc.output_polarity(layer, nos, pol)
    end

    def read
      nos.map do |no|
        speed_tacho_pair = dc.output_read(layer, no)
        speed_tacho_pair
      end
    end

    # ATTR running?
    def test
      nos.map do |no|
        busy = dc.output_test(layer, no)
        busy
      end
    end

    # which commands are affected? not output_start they say
    def ready
      dc.output_ready(layer, nos)
    end

    # @param power [Integer] -100..100
    # TODO better param protocol?
    def step_power(power, deg1, deg2, deg3, brake = Lignite::BRAKE)
      dc.output_step_power(layer, nos, power, deg1, deg2, deg3, brake)
    end

    # @param power [Integer] -100..100
    # msec
    def time_power(power, ms1, ms2, ms3, brake = Lignite::BRAKE)
      dc.output_time_power(layer, nos, power, ms1, ms2, ms3, brake)
    end

    # @param speed [Integer] -100..100
    # tachos
    def step_speed(speed, deg1, deg2, deg3, brake = Lignite::BRAKE)
      dc.output_step_speed(layer, nos, speed, deg1, deg2, deg3, brake)
    end

    # @param speed [Integer] -100..100
    # msec
    def time_speed(speed, ms1, ms2, ms3, brake = Lignite::BRAKE)
      dc.output_time_speed(layer, nos, speed, ms1, ms2, ms3, brake)
    end

    # @param speed [Integer] -100..100
    # @param turn [Integer] -200..200:
    #   0 straight, 100 stops the right motor, -100 stops the left motor
    #   > 100 reverses the right motor, < -100 reverses the left motor
    def step_sync(speed, turn, tachos, brake = Lignite::BRAKE)
      dc.output_step_sync(layer, nos, speed, turn, tachos, brake)
    end

    def time_sync(speed, turn, ms, brake = Lignite::BRAKE)
      dc.output_time_sync(layer, nos, speed, turn, ms, brake)
    end

    # zero tachos, for use as sensor
    def clr_count
      dc.output_clr_count(layer, nos)
    end

    # many motors, one out??
    def get_count
      tachos = dc.output_get_count(layer, nos)
      tachos
    end

    # WTF?
    def prg_stop
      dc.output_prg_stop
    end
  end
end
