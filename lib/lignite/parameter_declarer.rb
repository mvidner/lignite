module Lignite
  # Methods for user programs that declare subroutine parameters.
  module ParameterDeclarer
    IN = 0x80
    OUT = 0x40
    PAR8 = 0
    PAR16 = 1
    PAR32 = 2
    PARF = 3
    PARS = 4

    # @!method parameters
    #   @return [Variables]

    # Declare an 8-bit input parameter
    # @param name [Symbol] parameter name
    def in8(name)
      parameters.param(name, 1, 1, PAR8, IN)
    end

    # Declare an 8-bit output parameter
    # @param name [Symbol] parameter name
    def out8(name)
      parameters.param(name, 1, 1, PAR8, OUT)
    end

    # Declare an 8-bit input+output parameter
    # @param name [Symbol] parameter name
    def io8(name)
      parameters.param(name, 1, 1, PAR8, IN | OUT)
    end

    # Declare a 16-bit input parameter
    # @param name [Symbol] parameter name
    def in16(name)
      parameters.param(name, 2, 1, PAR16, IN)
    end

    # Declare a 16-bit output parameter
    # @param name [Symbol] parameter name
    def out16(name)
      parameters.param(name, 2, 1, PAR16, OUT)
    end

    # Declare a 16-bit input+output parameter
    # @param name [Symbol] parameter name
    def io16(name)
      parameters.param(name, 2, 1, PAR16, IN | OUT)
    end

    # Declare a 32-bit input parameter
    # @param name [Symbol] parameter name
    def in32(name)
      parameters.param(name, 4, 1, PAR32, IN)
    end

    # Declare a 32-bit output parameter
    # @param name [Symbol] parameter name
    def out32(name)
      parameters.param(name, 4, 1, PAR32, OUT)
    end

    # Declare a 32-bit input+output parameter
    # @param name [Symbol] parameter name
    def io32(name)
      parameters.param(name, 4, 1, PAR32, IN | OUT)
    end

    # Declare a floating-point input parameter
    # @param name [Symbol] parameter name
    def inf(name)
      parameters.param(name, 4, 1, PARF, IN)
    end

    # Declare a floating-point output parameter
    # @param name [Symbol] parameter name
    def outf(name)
      parameters.param(name, 4, 1, PARF, OUT)
    end

    # Declare a floating-point input+output parameter
    # @param name [Symbol] parameter name
    def iof(name)
      parameters.param(name, 4, 1, PARF, IN | OUT)
    end

    # Declare a string input parameter
    # @param name [Symbol] parameter name
    # @param size [Integer] maximum string size, including the terminating 0
    def ins(name, size)
      parameters.param(name, 1, size, PARS, IN)
    end

    # Declare a string output parameter
    # @param name [Symbol] parameter name
    # @param size [Integer] maximum string size, including the terminating 0
    def outs(name, size)
      parameters.param(name, 1, size, PARS, OUT)
    end

    # Declare a string input+output parameter
    # @param name [Symbol] parameter name
    # @param size [Integer] maximum string size, including the terminating 0
    def ios(name, size)
      parameters.param(name, 1, size, PARS, IN | OUT)
    end
  end
end
