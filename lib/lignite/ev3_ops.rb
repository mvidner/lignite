# This file is generated from ev3.yml. DO NOT EDIT.

module Lignite
  # Bytecodes implemented by EV3
  module Ev3Ops
    # This code does not exist in normal program
    def error
      logger.debug do
        args = []
        "called error with #{args.inspect}"
      end

      bytes = u8(0x00)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # This code does absolutely nothing
    def nop
      logger.debug do
        args = []
        "called nop with #{args.inspect}"
      end

      bytes = u8(0x01)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Stops specific program id slot
    # @param prgid [PAR16] (in) Program id (GUI_SLOT = all, CURRENT_SLOT = current)
    def program_stop(prgid)
      logger.debug do
        args = [prgid]
        "called program_stop with #{args.inspect}"
      end

      bytes = u8(0x02)
      bytes += param_simple(prgid)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Start program id slot
    # @param prgid [PAR16] (in) Program id
    # @param size [PAR32] (in) Size of image
    # @param ip [PAR32] (in) Address of image (value from opFILE(LOAD_IMAGE,..) )
    # @param debug [PAR8] (in) Debug mode (0=normal, 1=debug, 2=don't execute)
    def program_start(prgid, size, ip, debug)
      logger.debug do
        args = [prgid, size, ip, debug]
        "called program_start with #{args.inspect}"
      end

      bytes = u8(0x03)
      bytes += param_simple(prgid)
      bytes += param_simple(size)
      bytes += param_simple(ip)
      bytes += param_simple(debug)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Stops specific object
    # @param objid [PAR16] (in) Object id
    def object_stop(objid)
      logger.debug do
        args = [objid]
        "called object_stop with #{args.inspect}"
      end

      bytes = u8(0x04)
      bytes += param_simple(objid)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Start specific object
    # @param objid [PAR16] (in) Object id
    def object_start(objid)
      logger.debug do
        args = [objid]
        "called object_start with #{args.inspect}"
      end

      bytes = u8(0x05)
      bytes += param_simple(objid)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Triggers object and run the object if fully triggered
    # @param objid [PAR16] (in) Object id
    def object_trig(objid)
      logger.debug do
        args = [objid]
        "called object_trig with #{args.inspect}"
      end

      bytes = u8(0x06)
      bytes += param_simple(objid)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Wait until object has run
    # @param objid [PAR16] (in) Object id
    def object_wait(objid)
      logger.debug do
        args = [objid]
        "called object_wait with #{args.inspect}"
      end

      bytes = u8(0x07)
      bytes += param_simple(objid)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Return from byte code subroutine
    def return
      logger.debug do
        args = []
        "called return with #{args.inspect}"
      end

      bytes = u8(0x08)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Calls byte code subroutine
    # @param objid [PAR16] (in) Object id
    # @param parameters [PARNO] (in) Number of parameters
    def call(objid, *parameters)
      logger.debug do
        args = [objid, *parameters]
        "called call with #{args.inspect}"
      end

      bytes = u8(0x09)
      bytes += param_simple(objid)
      bytes += param_n_multiple(*parameters)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Stops current object
    def object_end
      logger.debug do
        args = []
        "called object_end with #{args.inspect}"
      end

      bytes = u8(0x0A)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Breaks execution of current VMTHREAD
    def sleep
      logger.debug do
        args = []
        "called sleep with #{args.inspect}"
      end

      bytes = u8(0x0B)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    #
    Lignite::OBJ_STOP = 0

    #
    # @param prgid [PAR16] (in) Program slot number
    # @param objid [PAR16] (in) Object id
    def program_info_obj_stop(prgid, objid)
      logger.debug do
        args = [prgid, objid]
        "called program_info_obj_stop with #{args.inspect}"
      end

      bytes = u8(0x0C)
      bytes += param_simple(0)
      bytes += param_simple(prgid)
      bytes += param_simple(objid)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::OBJ_START = 4

    #
    # @param prgid [PAR16] (in) Program slot number
    # @param objid [PAR16] (in) Object id
    def program_info_obj_start(prgid, objid)
      logger.debug do
        args = [prgid, objid]
        "called program_info_obj_start with #{args.inspect}"
      end

      bytes = u8(0x0C)
      bytes += param_simple(4)
      bytes += param_simple(prgid)
      bytes += param_simple(objid)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_STATUS = 22

    #
    # @param prgid [PAR16] (in) Program slot number
    # @param data [PAR8] (out) Program status
    def program_info_get_status(prgid, data)
      logger.debug do
        args = [prgid, data]
        "called program_info_get_status with #{args.inspect}"
      end

      bytes = u8(0x0C)
      bytes += param_simple(22)
      bytes += param_simple(prgid)
      bytes += param_simple(data)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_SPEED = 23

    #
    # @param prgid [PAR16] (in) Program slot number
    # @param data [PAR32] (out) Program speed [instr/S]
    def program_info_get_speed(prgid, data)
      logger.debug do
        args = [prgid, data]
        "called program_info_get_speed with #{args.inspect}"
      end

      bytes = u8(0x0C)
      bytes += param_simple(23)
      bytes += param_simple(prgid)
      bytes += param_simple(data)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_PRGRESULT = 24

    #
    # @param prgid [PAR16] (in) Program slot number
    # @param data [PAR8] (out) Program result [OK, BUSY, FAIL]
    def program_info_get_prgresult(prgid, data)
      logger.debug do
        args = [prgid, data]
        "called program_info_get_prgresult with #{args.inspect}"
      end

      bytes = u8(0x0C)
      bytes += param_simple(24)
      bytes += param_simple(prgid)
      bytes += param_simple(data)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Set number of instructions before VMThread change
    Lignite::SET_INSTR = 25

    # Set number of instructions before VMThread change
    # @param prgid [PAR16] (in) Program slot number
    def program_info_set_instr(prgid)
      logger.debug do
        args = [prgid]
        "called program_info_set_instr with #{args.inspect}"
      end

      bytes = u8(0x0C)
      bytes += param_simple(25)
      bytes += param_simple(prgid)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_PRGNAME = 26

    #
    # @param prgid [PAR16] (in) Program slot number
    # @param name [PAR8] (out) Program name
    def program_info_get_prgname(prgid, name)
      logger.debug do
        args = [prgid, name]
        "called program_info_get_prgname with #{args.inspect}"
      end

      bytes = u8(0x0C)
      bytes += param_simple(26)
      bytes += param_simple(prgid)
      bytes += param_simple(name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_PROGRAM_INFO = {
      0 => :obj_stop,
      4 => :obj_start,
      22 => :get_status,
      23 => :get_speed,
      24 => :get_prgresult,
      25 => :set_instr,
      26 => :get_prgname,
    }.freeze

    def program_info(*args)
      logger.debug "called program_info with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_PROGRAM_INFO.fetch(cvalue)
      __send__("program_info_#{csym}", *args)
    end

    # Could not define label: Unhandled param type PARLAB

    # Display globals or object locals on terminal
    # @param prgid [PAR16] (in) Program slot number
    # @param objid [PAR16] (in) Object id (zero means globals)
    # @param offset [PAR32] (in) Offset (start from)
    # @param size [PAR32] (in) Size (length of dump) zero means all (max 1024)
    def probe(prgid, objid, offset, size)
      logger.debug do
        args = [prgid, objid, offset, size]
        "called probe with #{args.inspect}"
      end

      bytes = u8(0x0E)
      bytes += param_simple(prgid)
      bytes += param_simple(objid)
      bytes += param_simple(offset)
      bytes += param_simple(size)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Run byte code snippet
    # @param prgid [PAR16] (in) Program slot number
    # @param image [PAR32] (in) Address of image
    # @param global [PAR32] (in) Address of global variables
    def do(prgid, image, global)
      logger.debug do
        args = [prgid, image, global]
        "called do with #{args.inspect}"
      end

      bytes = u8(0x0F)
      bytes += param_simple(prgid)
      bytes += param_simple(image)
      bytes += param_simple(global)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Add two 8-bit values DESTINATION = SOURCE1 + SOURCE2
    # @param source1 [PAR8] (in)
    # @param source2 [PAR8] (in)
    # @param destination [PAR8] (out)
    def add8(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called add8 with #{args.inspect}"
      end

      bytes = u8(0x10)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Add two 16-bit values DESTINATION = SOURCE1 + SOURCE2
    # @param source1 [PAR16] (in)
    # @param source2 [PAR16] (in)
    # @param destination [PAR16] (out)
    def add16(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called add16 with #{args.inspect}"
      end

      bytes = u8(0x11)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Add two 32-bit values DESTINATION = SOURCE1 + SOURCE2
    # @param source1 [PAR32] (in)
    # @param source2 [PAR32] (in)
    # @param destination [PAR32] (out)
    def add32(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called add32 with #{args.inspect}"
      end

      bytes = u8(0x12)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Add two floating point values DESTINATION = SOURCE1 + SOURCE2
    # @param source1 [PARF] (in)
    # @param source2 [PARF] (in)
    # @param destination [PARF] (out)
    def addf(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called addf with #{args.inspect}"
      end

      bytes = u8(0x13)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Subtract two 8 bit values DESTINATION = SOURCE1 - SOURCE2
    # @param source1 [PAR8] (in)
    # @param source2 [PAR8] (in)
    # @param destination [PAR8] (out)
    def sub8(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called sub8 with #{args.inspect}"
      end

      bytes = u8(0x14)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Subtract two 16 bit values DESTINATION = SOURCE1 - SOURCE2
    # @param source1 [PAR16] (in)
    # @param source2 [PAR16] (in)
    # @param destination [PAR16] (out)
    def sub16(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called sub16 with #{args.inspect}"
      end

      bytes = u8(0x15)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Subtract two 32 bit values DESTINATION = SOURCE1 - SOURCE2
    # @param source1 [PAR32] (in)
    # @param source2 [PAR32] (in)
    # @param destination [PAR32] (out)
    def sub32(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called sub32 with #{args.inspect}"
      end

      bytes = u8(0x16)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Subtract two floating point values DESTINATION = SOURCE1 - SOURCE2
    # @param source1 [PARF] (in)
    # @param source2 [PARF] (in)
    # @param destination [PARF] (out)
    def subf(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called subf with #{args.inspect}"
      end

      bytes = u8(0x17)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Multiply two 8 bit values DESTINATION = SOURCE1 * SOURCE2
    # @param source1 [PAR8] (in)
    # @param source2 [PAR8] (in)
    # @param destination [PAR8] (out)
    def mul8(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called mul8 with #{args.inspect}"
      end

      bytes = u8(0x18)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Multiply two 16 bit values DESTINATION = SOURCE1 * SOURCE2
    # @param source1 [PAR16] (in)
    # @param source2 [PAR16] (in)
    # @param destination [PAR16] (out)
    def mul16(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called mul16 with #{args.inspect}"
      end

      bytes = u8(0x19)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Multiply two 32 bit values DESTINATION = SOURCE1 * SOURCE2
    # @param source1 [PAR32] (in)
    # @param source2 [PAR32] (in)
    # @param destination [PAR32] (out)
    def mul32(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called mul32 with #{args.inspect}"
      end

      bytes = u8(0x1A)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Multiply two floating point values DESTINATION = SOURCE1 * SOURCE2
    # @param source1 [PARF] (in)
    # @param source2 [PARF] (in)
    # @param destination [PARF] (out)
    def mulf(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called mulf with #{args.inspect}"
      end

      bytes = u8(0x1B)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Divide two 8 bit values DESTINATION = SOURCE1 / SOURCE2
    # @param source1 [PAR8] (in)
    # @param source2 [PAR8] (in)
    # @param destination [PAR8] (out)
    def div8(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called div8 with #{args.inspect}"
      end

      bytes = u8(0x1C)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Divide two 16 bit values DESTINATION = SOURCE1 / SOURCE2
    # @param source1 [PAR16] (in)
    # @param source2 [PAR16] (in)
    # @param destination [PAR16] (out)
    def div16(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called div16 with #{args.inspect}"
      end

      bytes = u8(0x1D)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Divide two 32 bit values DESTINATION = SOURCE1 / SOURCE2
    # @param source1 [PAR32] (in)
    # @param source2 [PAR32] (in)
    # @param destination [PAR32] (out)
    def div32(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called div32 with #{args.inspect}"
      end

      bytes = u8(0x1E)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Divide two floating point values DESTINATION = SOURCE1 / SOURCE2
    # @param source1 [PARF] (in)
    # @param source2 [PARF] (in)
    # @param destination [PARF] (out)
    def divf(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called divf with #{args.inspect}"
      end

      bytes = u8(0x1F)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Or two 8 bit values DESTINATION = SOURCE1 | SOURCE2
    # @param source1 [PAR8] (in)
    # @param source2 [PAR8] (in)
    # @param destination [PAR8] (out)
    def or8(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called or8 with #{args.inspect}"
      end

      bytes = u8(0x20)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Or two 16 bit values DESTINATION = SOURCE1 | SOURCE2
    # @param source1 [PAR16] (in)
    # @param source2 [PAR16] (in)
    # @param destination [PAR16] (out)
    def or16(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called or16 with #{args.inspect}"
      end

      bytes = u8(0x21)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Or two 32 bit values DESTINATION = SOURCE1 | SOURCE2
    # @param source1 [PAR32] (in)
    # @param source2 [PAR32] (in)
    # @param destination [PAR32] (out)
    def or32(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called or32 with #{args.inspect}"
      end

      bytes = u8(0x22)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # And two 8 bit values DESTINATION = SOURCE1 & SOURCE2
    # @param source1 [PAR8] (in)
    # @param source2 [PAR8] (in)
    # @param destination [PAR8] (out)
    def and8(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called and8 with #{args.inspect}"
      end

      bytes = u8(0x24)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # And two 16 bit values DESTINATION = SOURCE1 & SOURCE2
    # @param source1 [PAR16] (in)
    # @param source2 [PAR16] (in)
    # @param destination [PAR16] (out)
    def and16(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called and16 with #{args.inspect}"
      end

      bytes = u8(0x25)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # And two 32 bit values DESTINATION = SOURCE1 & SOURCE2
    # @param source1 [PAR32] (in)
    # @param source2 [PAR32] (in)
    # @param destination [PAR32] (out)
    def and32(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called and32 with #{args.inspect}"
      end

      bytes = u8(0x26)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Exclusive or two 8 bit values DESTINATION = SOURCE1 ^ SOURCE2
    # @param source1 [PAR8] (in)
    # @param source2 [PAR8] (in)
    # @param destination [PAR8] (out)
    def xor8(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called xor8 with #{args.inspect}"
      end

      bytes = u8(0x28)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Exclusive or two 16 bit values DESTINATION = SOURCE1 ^ SOURCE2
    # @param source1 [PAR16] (in)
    # @param source2 [PAR16] (in)
    # @param destination [PAR16] (out)
    def xor16(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called xor16 with #{args.inspect}"
      end

      bytes = u8(0x29)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Exclusive or two 32 bit values DESTINATION = SOURCE1 ^ SOURCE2
    # @param source1 [PAR32] (in)
    # @param source2 [PAR32] (in)
    # @param destination [PAR32] (out)
    def xor32(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called xor32 with #{args.inspect}"
      end

      bytes = u8(0x2A)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Rotate left 8 bit value DESTINATION = SOURCE1 << SOURCE2
    # @param source1 [PAR8] (in)
    # @param source2 [PAR8] (in)
    # @param destination [PAR8] (out)
    def rl8(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called rl8 with #{args.inspect}"
      end

      bytes = u8(0x2C)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Rotate left 16 bit value DESTINATION = SOURCE1 << SOURCE2
    # @param source1 [PAR16] (in)
    # @param source2 [PAR16] (in)
    # @param destination [PAR16] (out)
    def rl16(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called rl16 with #{args.inspect}"
      end

      bytes = u8(0x2D)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Rotate left 32 bit value DESTINATION = SOURCE1 << SOURCE2
    # @param source1 [PAR32] (in)
    # @param source2 [PAR32] (in)
    # @param destination [PAR32] (out)
    def rl32(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called rl32 with #{args.inspect}"
      end

      bytes = u8(0x2E)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move LENGTH number of DATA8 from BYTE STREAM to memory DESTINATION START
    # @param destination [PAR8] (out) First element in DATA8 array to be initiated
    # @param length [PAR32] (in) Number of elements to initiate
    # @param source [PARVALUES] (in) First element to initiate DATA8 array with
    def init_bytes(destination, length, *source)
      logger.debug do
        args = [destination, length, *source]
        "called init_bytes with #{args.inspect}"
      end

      bytes = u8(0x2F)
      bytes += param_simple(destination)
      bytes += param_simple(length)
      bytes += param_multiple(*source)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 8 bit value from SOURCE to DESTINATION
    # @param source [PAR8] (in)
    # @param destination [PAR8] (out)
    def move8_8(source, destination)
      logger.debug do
        args = [source, destination]
        "called move8_8 with #{args.inspect}"
      end

      bytes = u8(0x30)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 8 bit value from SOURCE to DESTINATION
    # @param source [PAR8] (in)
    # @param destination [PAR16] (out)
    def move8_16(source, destination)
      logger.debug do
        args = [source, destination]
        "called move8_16 with #{args.inspect}"
      end

      bytes = u8(0x31)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 8 bit value from SOURCE to DESTINATION
    # @param source [PAR8] (in)
    # @param destination [PAR32] (out)
    def move8_32(source, destination)
      logger.debug do
        args = [source, destination]
        "called move8_32 with #{args.inspect}"
      end

      bytes = u8(0x32)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 8 bit value from SOURCE to DESTINATION
    # @param source [PAR8] (in)
    # @param destination [PARF] (out)
    def move8_f(source, destination)
      logger.debug do
        args = [source, destination]
        "called move8_f with #{args.inspect}"
      end

      bytes = u8(0x33)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 16 bit value from SOURCE to DESTINATION
    # @param source [PAR16] (in)
    # @param destination [PAR8] (out)
    def move16_8(source, destination)
      logger.debug do
        args = [source, destination]
        "called move16_8 with #{args.inspect}"
      end

      bytes = u8(0x34)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 16 bit value from SOURCE to DESTINATION
    # @param source [PAR16] (in)
    # @param destination [PAR16] (out)
    def move16_16(source, destination)
      logger.debug do
        args = [source, destination]
        "called move16_16 with #{args.inspect}"
      end

      bytes = u8(0x35)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 16 bit value from SOURCE to DESTINATION
    # @param source [PAR16] (in)
    # @param destination [PAR32] (out)
    def move16_32(source, destination)
      logger.debug do
        args = [source, destination]
        "called move16_32 with #{args.inspect}"
      end

      bytes = u8(0x36)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 16 bit value from SOURCE to DESTINATION
    # @param source [PAR16] (in)
    # @param destination [PARF] (out)
    def move16_f(source, destination)
      logger.debug do
        args = [source, destination]
        "called move16_f with #{args.inspect}"
      end

      bytes = u8(0x37)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 32 bit value from SOURCE to DESTINATION
    # @param source [PAR32] (in)
    # @param destination [PAR8] (out)
    def move32_8(source, destination)
      logger.debug do
        args = [source, destination]
        "called move32_8 with #{args.inspect}"
      end

      bytes = u8(0x38)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 32 bit value from SOURCE to DESTINATION
    # @param source [PAR32] (in)
    # @param destination [PAR16] (out)
    def move32_16(source, destination)
      logger.debug do
        args = [source, destination]
        "called move32_16 with #{args.inspect}"
      end

      bytes = u8(0x39)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 32 bit value from SOURCE to DESTINATION
    # @param source [PAR32] (in)
    # @param destination [PAR32] (out)
    def move32_32(source, destination)
      logger.debug do
        args = [source, destination]
        "called move32_32 with #{args.inspect}"
      end

      bytes = u8(0x3A)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move 32 bit value from SOURCE to DESTINATION
    # @param source [PAR32] (in)
    # @param destination [PARF] (out)
    def move32_f(source, destination)
      logger.debug do
        args = [source, destination]
        "called move32_f with #{args.inspect}"
      end

      bytes = u8(0x3B)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move floating point value from SOURCE to DESTINATION
    # @param source [PARF] (in)
    # @param destination [PAR8] (out)
    def movef_8(source, destination)
      logger.debug do
        args = [source, destination]
        "called movef_8 with #{args.inspect}"
      end

      bytes = u8(0x3C)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move floating point value from SOURCE to DESTINATION
    # @param source [PARF] (in)
    # @param destination [PAR16] (out)
    def movef_16(source, destination)
      logger.debug do
        args = [source, destination]
        "called movef_16 with #{args.inspect}"
      end

      bytes = u8(0x3D)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move floating point value from SOURCE to DESTINATION
    # @param source [PARF] (in)
    # @param destination [PAR32] (out)
    def movef_32(source, destination)
      logger.debug do
        args = [source, destination]
        "called movef_32 with #{args.inspect}"
      end

      bytes = u8(0x3E)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Move floating point value from SOURCE to DESTINATION
    # @param source [PARF] (in)
    # @param destination [PARF] (out)
    def movef_f(source, destination)
      logger.debug do
        args = [source, destination]
        "called movef_f with #{args.inspect}"
      end

      bytes = u8(0x3F)
      bytes += param_simple(source)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch unconditionally relative
    # @param offset [PAR32] (in)
    def jr(offset)
      logger.debug do
        args = [offset]
        "called jr with #{args.inspect}"
      end

      bytes = u8(0x40)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative if FLAG is FALSE (zero)
    # @param flag [PAR8] (in)
    # @param offset [PAR32] (in)
    def jr_false(flag, offset)
      logger.debug do
        args = [flag, offset]
        "called jr_false with #{args.inspect}"
      end

      bytes = u8(0x41)
      bytes += param_simple(flag)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative if FLAG is TRUE (non zero)
    # @param flag [PAR8] (in)
    # @param offset [PAR32] (in)
    def jr_true(flag, offset)
      logger.debug do
        args = [flag, offset]
        "called jr_true with #{args.inspect}"
      end

      bytes = u8(0x42)
      bytes += param_simple(flag)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative if VALUE is NAN (not a number)
    # @param value [PARF] (in)
    # @param offset [PAR32] (in)
    def jr_nan(value, offset)
      logger.debug do
        args = [value, offset]
        "called jr_nan with #{args.inspect}"
      end

      bytes = u8(0x43)
      bytes += param_simple(value)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is less than RIGTH - set FLAG
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param flag [PAR8] (out)
    def cp_lt8(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_lt8 with #{args.inspect}"
      end

      bytes = u8(0x44)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is less than RIGTH - set FLAG
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param flag [PAR8] (out)
    def cp_lt16(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_lt16 with #{args.inspect}"
      end

      bytes = u8(0x45)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is less than RIGTH - set FLAG
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param flag [PAR8] (out)
    def cp_lt32(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_lt32 with #{args.inspect}"
      end

      bytes = u8(0x46)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is less than RIGTH - set FLAG
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param flag [PAR8] (out)
    def cp_ltf(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_ltf with #{args.inspect}"
      end

      bytes = u8(0x47)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is greater than RIGTH - set FLAG
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param flag [PAR8] (out)
    def cp_gt8(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_gt8 with #{args.inspect}"
      end

      bytes = u8(0x48)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is greater than RIGTH - set FLAG
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param flag [PAR8] (out)
    def cp_gt16(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_gt16 with #{args.inspect}"
      end

      bytes = u8(0x49)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is greater than RIGTH - set FLAG
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param flag [PAR8] (out)
    def cp_gt32(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_gt32 with #{args.inspect}"
      end

      bytes = u8(0x4A)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is greater than RIGTH - set FLAG
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param flag [PAR8] (out)
    def cp_gtf(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_gtf with #{args.inspect}"
      end

      bytes = u8(0x4B)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is equal to RIGTH - set FLAG
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param flag [PAR8] (out)
    def cp_eq8(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_eq8 with #{args.inspect}"
      end

      bytes = u8(0x4C)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is equal to RIGTH - set FLAG
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param flag [PAR8] (out)
    def cp_eq16(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_eq16 with #{args.inspect}"
      end

      bytes = u8(0x4D)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is equal to RIGTH - set FLAG
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param flag [PAR8] (out)
    def cp_eq32(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_eq32 with #{args.inspect}"
      end

      bytes = u8(0x4E)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is equal to RIGTH - set FLAG
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param flag [PAR8] (out)
    def cp_eqf(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_eqf with #{args.inspect}"
      end

      bytes = u8(0x4F)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is not equal to RIGTH - set FLAG
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param flag [PAR8] (out)
    def cp_neq8(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_neq8 with #{args.inspect}"
      end

      bytes = u8(0x50)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is not equal to RIGTH - set FLAG
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param flag [PAR8] (out)
    def cp_neq16(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_neq16 with #{args.inspect}"
      end

      bytes = u8(0x51)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is not equal to RIGTH - set FLAG
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param flag [PAR8] (out)
    def cp_neq32(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_neq32 with #{args.inspect}"
      end

      bytes = u8(0x52)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is not equal to RIGTH - set FLAG
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param flag [PAR8] (out)
    def cp_neqf(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_neqf with #{args.inspect}"
      end

      bytes = u8(0x53)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is less than or equal to RIGTH - set FLAG
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param flag [PAR8] (out)
    def cp_lteq8(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_lteq8 with #{args.inspect}"
      end

      bytes = u8(0x54)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is less than or equal to RIGTH - set FLAG
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param flag [PAR8] (out)
    def cp_lteq16(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_lteq16 with #{args.inspect}"
      end

      bytes = u8(0x55)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is less than or equal to RIGTH - set FLAG
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param flag [PAR8] (out)
    def cp_lteq32(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_lteq32 with #{args.inspect}"
      end

      bytes = u8(0x56)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is less than or equal to RIGTH - set FLAG
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param flag [PAR8] (out)
    def cp_lteqf(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_lteqf with #{args.inspect}"
      end

      bytes = u8(0x57)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is greater than or equal to RIGTH - set FLAG
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param flag [PAR8] (out)
    def cp_gteq8(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_gteq8 with #{args.inspect}"
      end

      bytes = u8(0x58)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is greater than or equal to RIGTH - set FLAG
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param flag [PAR8] (out)
    def cp_gteq16(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_gteq16 with #{args.inspect}"
      end

      bytes = u8(0x59)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is greater than or equal to RIGTH - set FLAG
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param flag [PAR8] (out)
    def cp_gteq32(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_gteq32 with #{args.inspect}"
      end

      bytes = u8(0x5A)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If LEFT is greater than or equal to RIGTH - set FLAG
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param flag [PAR8] (out)
    def cp_gteqf(left, right, flag)
      logger.debug do
        args = [left, right, flag]
        "called cp_gteqf with #{args.inspect}"
      end

      bytes = u8(0x5B)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If FLAG is set move SOURCE1 to RESULT else move SOURCE2 to RESULT
    # @param flag [PAR8] (in)
    # @param source1 [PAR8] (in)
    # @param source2 [PAR8] (in)
    # @param result [PAR8] (out)
    def select8(flag, source1, source2, result)
      logger.debug do
        args = [flag, source1, source2, result]
        "called select8 with #{args.inspect}"
      end

      bytes = u8(0x5C)
      bytes += param_simple(flag)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If FLAG is set move SOURCE1 to RESULT else move SOURCE2 to RESULT
    # @param flag [PAR8] (in)
    # @param source1 [PAR16] (in)
    # @param source2 [PAR16] (in)
    # @param result [PAR16] (out)
    def select16(flag, source1, source2, result)
      logger.debug do
        args = [flag, source1, source2, result]
        "called select16 with #{args.inspect}"
      end

      bytes = u8(0x5D)
      bytes += param_simple(flag)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If FLAG is set move SOURCE1 to RESULT else move SOURCE2 to RESULT
    # @param flag [PAR8] (in)
    # @param source1 [PAR32] (in)
    # @param source2 [PAR32] (in)
    # @param result [PAR32] (out)
    def select32(flag, source1, source2, result)
      logger.debug do
        args = [flag, source1, source2, result]
        "called select32 with #{args.inspect}"
      end

      bytes = u8(0x5E)
      bytes += param_simple(flag)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # If FLAG is set move SOURCE1 to RESULT else move SOURCE2 to RESULT
    # @param flag [PAR8] (in)
    # @param source1 [PARF] (in)
    # @param source2 [PARF] (in)
    # @param result [PARF] (out)
    def selectf(flag, source1, source2, result)
      logger.debug do
        args = [flag, source1, source2, result]
        "called selectf with #{args.inspect}"
      end

      bytes = u8(0x5F)
      bytes += param_simple(flag)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Executes a system command
    # @param command [PAR8] (in) Command string (HND)
    # @param status [PAR32] (out) Return status of the command
    def system(command, status)
      logger.debug do
        args = [command, status]
        "called system with #{args.inspect}"
      end

      bytes = u8(0x60)
      bytes += param_simple(command)
      bytes += param_simple(status)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Convert encoded port to Layer and Bitfield
    # @param portin [PAR32] (in) EncodedPortNumber
    # @param layer [PAR8] (out) Layer
    # @param bitfield [PAR8] (out) Bitfield
    # @param inverted [PAR8] (out) yes if left/right motor are inverted (ie, C&A)
    def port_cnv_output(portin, layer, bitfield, inverted)
      logger.debug do
        args = [portin, layer, bitfield, inverted]
        "called port_cnv_output with #{args.inspect}"
      end

      bytes = u8(0x61)
      bytes += param_simple(portin)
      bytes += param_simple(layer)
      bytes += param_simple(bitfield)
      bytes += param_simple(inverted)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Convert encoded port to Layer and Port
    # @param portin [PAR32] (in) EncodedPortNumber
    # @param layer [PAR8] (out) Layer
    # @param portout [PAR8] (out) 0-index port for use with VM commands
    def port_cnv_input(portin, layer, portout)
      logger.debug do
        args = [portin, layer, portout]
        "called port_cnv_input with #{args.inspect}"
      end

      bytes = u8(0x62)
      bytes += param_simple(portin)
      bytes += param_simple(layer)
      bytes += param_simple(portout)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Convert note to tone
    # @param note [PAR8] (in) Note string (HND) (e.c. "C#4")
    # @param freq [PAR16] (out) Frequency [Hz]
    def note_to_freq(note, freq)
      logger.debug do
        args = [note, freq]
        "called note_to_freq with #{args.inspect}"
      end

      bytes = u8(0x63)
      bytes += param_simple(note)
      bytes += param_simple(freq)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is less than RIGHT
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param offset [PAR32] (in)
    def jr_lt8(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_lt8 with #{args.inspect}"
      end

      bytes = u8(0x64)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is less than RIGHT
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param offset [PAR32] (in)
    def jr_lt16(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_lt16 with #{args.inspect}"
      end

      bytes = u8(0x65)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is less than RIGHT
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param offset [PAR32] (in)
    def jr_lt32(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_lt32 with #{args.inspect}"
      end

      bytes = u8(0x66)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is less than RIGHT
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param offset [PAR32] (in)
    def jr_ltf(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_ltf with #{args.inspect}"
      end

      bytes = u8(0x67)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is greater than RIGHT
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param offset [PAR32] (in)
    def jr_gt8(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_gt8 with #{args.inspect}"
      end

      bytes = u8(0x68)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is greater than RIGHT
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param offset [PAR32] (in)
    def jr_gt16(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_gt16 with #{args.inspect}"
      end

      bytes = u8(0x69)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is greater than RIGHT
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param offset [PAR32] (in)
    def jr_gt32(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_gt32 with #{args.inspect}"
      end

      bytes = u8(0x6A)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is greater than RIGHT
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param offset [PAR32] (in)
    def jr_gtf(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_gtf with #{args.inspect}"
      end

      bytes = u8(0x6B)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is equal to RIGHT
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param offset [PAR32] (in)
    def jr_eq8(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_eq8 with #{args.inspect}"
      end

      bytes = u8(0x6C)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is equal to RIGHT
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param offset [PAR32] (in)
    def jr_eq16(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_eq16 with #{args.inspect}"
      end

      bytes = u8(0x6D)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is equal to RIGHT
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param offset [PAR32] (in)
    def jr_eq32(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_eq32 with #{args.inspect}"
      end

      bytes = u8(0x6E)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is equal to RIGHT
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param offset [PAR32] (in)
    def jr_eqf(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_eqf with #{args.inspect}"
      end

      bytes = u8(0x6F)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is not equal to RIGHT
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param offset [PAR32] (in)
    def jr_neq8(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_neq8 with #{args.inspect}"
      end

      bytes = u8(0x70)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is not equal to RIGHT
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param offset [PAR32] (in)
    def jr_neq16(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_neq16 with #{args.inspect}"
      end

      bytes = u8(0x71)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is not equal to RIGHT
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param offset [PAR32] (in)
    def jr_neq32(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_neq32 with #{args.inspect}"
      end

      bytes = u8(0x72)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is not equal to RIGHT
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param offset [PAR32] (in)
    def jr_neqf(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_neqf with #{args.inspect}"
      end

      bytes = u8(0x73)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is less than or equal to RIGHT
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param offset [PAR32] (in)
    def jr_lteq8(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_lteq8 with #{args.inspect}"
      end

      bytes = u8(0x74)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is less than or equal to RIGHT
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param offset [PAR32] (in)
    def jr_lteq16(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_lteq16 with #{args.inspect}"
      end

      bytes = u8(0x75)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is less than or equal to RIGHT
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param offset [PAR32] (in)
    def jr_lteq32(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_lteq32 with #{args.inspect}"
      end

      bytes = u8(0x76)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is less than or equal to RIGHT
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param offset [PAR32] (in)
    def jr_lteqf(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_lteqf with #{args.inspect}"
      end

      bytes = u8(0x77)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is greater than or equal to RIGHT
    # @param left [PAR8] (in)
    # @param right [PAR8] (in)
    # @param offset [PAR32] (in)
    def jr_gteq8(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_gteq8 with #{args.inspect}"
      end

      bytes = u8(0x78)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is greater than or equal to RIGHT
    # @param left [PAR16] (in)
    # @param right [PAR16] (in)
    # @param offset [PAR32] (in)
    def jr_gteq16(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_gteq16 with #{args.inspect}"
      end

      bytes = u8(0x79)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is greater than or equal to RIGHT
    # @param left [PAR32] (in)
    # @param right [PAR32] (in)
    # @param offset [PAR32] (in)
    def jr_gteq32(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_gteq32 with #{args.inspect}"
      end

      bytes = u8(0x7A)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Branch relative OFFSET if LEFT is greater than or equal to RIGHT
    # @param left [PARF] (in)
    # @param right [PARF] (in)
    # @param offset [PAR32] (in)
    def jr_gteqf(left, right, offset)
      logger.debug do
        args = [left, right, offset]
        "called jr_gteqf with #{args.inspect}"
      end

      bytes = u8(0x7B)
      bytes += param_simple(left)
      bytes += param_simple(right)
      bytes += param_simple(offset)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    #
    Lignite::SET_ERROR = 1

    #
    # @param number [PAR8] (in) Error number
    def info_set_error(number)
      logger.debug do
        args = [number]
        "called info_set_error with #{args.inspect}"
      end

      bytes = u8(0x7C)
      bytes += param_simple(1)
      bytes += param_simple(number)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_ERROR = 2

    #
    # @param number [PAR8] (out) Error number
    def info_get_error(number)
      logger.debug do
        args = [number]
        "called info_get_error with #{args.inspect}"
      end

      bytes = u8(0x7C)
      bytes += param_simple(2)
      bytes += param_simple(number)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Convert error number to text string
    Lignite::ERRORTEXT = 3

    # Convert error number to text string
    # @param number [PAR8] (in) Error number
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def info_errortext(number, length, destination)
      logger.debug do
        args = [number, length, destination]
        "called info_errortext with #{args.inspect}"
      end

      bytes = u8(0x7C)
      bytes += param_simple(3)
      bytes += param_simple(number)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_VOLUME = 4

    #
    # @param value [PAR8] (out) Volume [0..100%]
    def info_get_volume(value)
      logger.debug do
        args = [value]
        "called info_get_volume with #{args.inspect}"
      end

      bytes = u8(0x7C)
      bytes += param_simple(4)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SET_VOLUME = 5

    #
    # @param value [PAR8] (in) Volume [0..100%]
    def info_set_volume(value)
      logger.debug do
        args = [value]
        "called info_set_volume with #{args.inspect}"
      end

      bytes = u8(0x7C)
      bytes += param_simple(5)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_MINUTES = 6

    #
    # @param value [PAR8] (out) Minutes to sleep [0..120min] (0 = never)
    def info_get_minutes(value)
      logger.debug do
        args = [value]
        "called info_get_minutes with #{args.inspect}"
      end

      bytes = u8(0x7C)
      bytes += param_simple(6)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SET_MINUTES = 7

    #
    # @param value [PAR8] (in) Minutes to sleep [0..120min] (0 = never)
    def info_set_minutes(value)
      logger.debug do
        args = [value]
        "called info_set_minutes with #{args.inspect}"
      end

      bytes = u8(0x7C)
      bytes += param_simple(7)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_INFO = {
      1 => :set_error,
      2 => :get_error,
      3 => :errortext,
      4 => :get_volume,
      5 => :set_volume,
      6 => :get_minutes,
      7 => :set_minutes,
    }.freeze

    def info(*args)
      logger.debug "called info with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_INFO.fetch(cvalue)
      __send__("info_#{csym}", *args)
    end

    # Get size of string (not including zero termination)
    Lignite::GET_SIZE = 1

    # Get size of string (not including zero termination)
    # @param source1 [PAR8] (in) String variable or handle to string
    # @param size [PAR16] (out) Size
    def strings_get_size(source1, size)
      logger.debug do
        args = [source1, size]
        "called strings_get_size with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(1)
      bytes += param_simple(source1)
      bytes += param_simple(size)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Add two strings (SOURCE1 + SOURCE2 -> DESTINATION)
    Lignite::ADD = 2

    # Add two strings (SOURCE1 + SOURCE2 -> DESTINATION)
    # @param source1 [PAR8] (in) String variable or handle to string
    # @param source2 [PAR8] (in) String variable or handle to string
    # @param destination [PAR8] (out) String variable or handle to string
    def strings_add(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called strings_add with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(2)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Compare two strings
    Lignite::COMPARE = 3

    # Compare two strings
    # @param source1 [PAR8] (in) String variable or handle to string
    # @param source2 [PAR8] (in) String variable or handle to string
    # @param result [PAR8] (out) Result (0 = not equal, 1 = equal)
    def strings_compare(source1, source2, result)
      logger.debug do
        args = [source1, source2, result]
        "called strings_compare with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(3)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Duplicate a string (SOURCE1 -> DESTINATION)
    Lignite::DUPLICATE = 5

    # Duplicate a string (SOURCE1 -> DESTINATION)
    # @param source1 [PAR8] (in) String variable or handle to string
    # @param destination [PAR8] (out) String variable or handle to string
    def strings_duplicate(source1, destination)
      logger.debug do
        args = [source1, destination]
        "called strings_duplicate with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(5)
      bytes += param_simple(source1)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Convert floating point value to a string (strips trailing zeroes)
    Lignite::VALUE_TO_STRING = 6

    # Convert floating point value to a string (strips trailing zeroes)
    # @param value [PARF] (in) Value to write (if "nan" op to 4 dashes is returned: "----")
    # @param figures [PAR8] (in) Total number of figures inclusive decimal point (FIGURES < 0 -> Left adjusted)

    # @param decimals [PAR8] (in) Number of decimals
    # @param destination [PAR8] (out) String variable or handle to string
    def strings_value_to_string(value, figures, decimals, destination)
      logger.debug do
        args = [value, figures, decimals, destination]
        "called strings_value_to_string with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(6)
      bytes += param_simple(value)
      bytes += param_simple(figures)
      bytes += param_simple(decimals)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::STRING_TO_VALUE = 7

    #
    # @param source1 [PAR8] (in) String variable or handle to string
    # @param destination [PARF] (out) Value
    def strings_string_to_value(source1, destination)
      logger.debug do
        args = [source1, destination]
        "called strings_string_to_value with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(7)
      bytes += param_simple(source1)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Strip a string for spaces (SOURCE1 -> DESTINATION)
    Lignite::STRIP = 8

    # Strip a string for spaces (SOURCE1 -> DESTINATION)
    # @param source1 [PAR8] (in) String variable or handle to string
    # @param destination [PAR8] (out) String variable or handle to string
    def strings_strip(source1, destination)
      logger.debug do
        args = [source1, destination]
        "called strings_strip with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(8)
      bytes += param_simple(source1)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Convert integer value to a string
    Lignite::NUMBER_TO_STRING = 9

    # Convert integer value to a string
    # @param value [PAR16] (in) Value to write
    # @param figures [PAR8] (in) Total number of figures
    # @param destination [PAR8] (out) String variable or handle to string
    def strings_number_to_string(value, figures, destination)
      logger.debug do
        args = [value, figures, destination]
        "called strings_number_to_string with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(9)
      bytes += param_simple(value)
      bytes += param_simple(figures)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Return DESTINATION: a substring from SOURCE1 that starts were SOURCE2 ends
    Lignite::SUB = 10

    # Return DESTINATION: a substring from SOURCE1 that starts were SOURCE2 ends
    # @param source1 [PAR8] (in) String variable or handle to string
    # @param source2 [PAR8] (in) String variable or handle to string
    # @param destination [PAR8] (out) String variable or handle to string
    def strings_sub(source1, source2, destination)
      logger.debug do
        args = [source1, source2, destination]
        "called strings_sub with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(10)
      bytes += param_simple(source1)
      bytes += param_simple(source2)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Convert floating point value to a formatted string
    Lignite::VALUE_FORMATTED = 11

    # Convert floating point value to a formatted string
    # @param value [PARF] (in) Value to write
    # @param format [PAR8] (in) Format string variable or handle to string
    # @param size [PAR8] (in) Total size of destination string
    # @param destination [PAR8] (out) String variable or handle to string
    def strings_value_formatted(value, format, size, destination)
      logger.debug do
        args = [value, format, size, destination]
        "called strings_value_formatted with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(11)
      bytes += param_simple(value)
      bytes += param_simple(format)
      bytes += param_simple(size)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Convert integer number to a formatted string
    Lignite::NUMBER_FORMATTED = 12

    # Convert integer number to a formatted string
    # @param value [PAR32] (in) Number to write
    # @param format [PAR8] (in) Format string variable or handle to string
    # @param size [PAR8] (in) Total size of destination string
    # @param destination [PAR8] (out) String variable or handle to string
    def strings_number_formatted(value, format, size, destination)
      logger.debug do
        args = [value, format, size, destination]
        "called strings_number_formatted with #{args.inspect}"
      end

      bytes = u8(0x7D)
      bytes += param_simple(12)
      bytes += param_simple(value)
      bytes += param_simple(format)
      bytes += param_simple(size)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_STRINGS = {
      1 => :get_size,
      2 => :add,
      3 => :compare,
      5 => :duplicate,
      6 => :value_to_string,
      7 => :string_to_value,
      8 => :strip,
      9 => :number_to_string,
      10 => :sub,
      11 => :value_formatted,
      12 => :number_formatted,
    }.freeze

    def strings(*args)
      logger.debug "called strings with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_STRINGS.fetch(cvalue)
      __send__("strings_#{csym}", *args)
    end

    # Write VM memory
    # @param prgid [PAR16] (in) Program slot number (must be running)
    # @param objid [PAR16] (in) Object id (zero means globals)
    # @param offset [PAR32] (in) Offset (start from)
    # @param size [PAR32] (in) Size (length of array to write)
    # @param array [PAR8] (in) First element of DATA8 array to write
    def memory_write(prgid, objid, offset, size, array)
      logger.debug do
        args = [prgid, objid, offset, size, array]
        "called memory_write with #{args.inspect}"
      end

      bytes = u8(0x7E)
      bytes += param_simple(prgid)
      bytes += param_simple(objid)
      bytes += param_simple(offset)
      bytes += param_simple(size)
      bytes += param_simple(array)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read VM memory
    # @param prgid [PAR16] (in) Program slot number (must be running)
    # @param objid [PAR16] (in) Object id (zero means globals)
    # @param offset [PAR32] (in) Offset (start from)
    # @param size [PAR32] (in) Size (length of array to read)
    # @param array [PAR8] (out) First element of DATA8 array to receive data
    def memory_read(prgid, objid, offset, size, array)
      logger.debug do
        args = [prgid, objid, offset, size, array]
        "called memory_read with #{args.inspect}"
      end

      bytes = u8(0x7F)
      bytes += param_simple(prgid)
      bytes += param_simple(objid)
      bytes += param_simple(offset)
      bytes += param_simple(size)
      bytes += param_simple(array)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # User Interface flush buffers
    def ui_flush
      logger.debug do
        args = []
        "called ui_flush with #{args.inspect}"
      end

      bytes = u8(0x80)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    #
    Lignite::GET_VBATT = 1

    #
    # @param value [PARF] (out) Battery voltage [V]
    def ui_read_get_vbatt(value)
      logger.debug do
        args = [value]
        "called ui_read_get_vbatt with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(1)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_IBATT = 2

    #
    # @param value [PARF] (out) Battery current [A]
    def ui_read_get_ibatt(value)
      logger.debug do
        args = [value]
        "called ui_read_get_ibatt with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(2)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get os version string
    Lignite::GET_OS_VERS = 3

    # Get os version string
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def ui_read_get_os_vers(length, destination)
      logger.debug do
        args = [length, destination]
        "called ui_read_get_os_vers with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(3)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_EVENT = 4

    #
    # @param event [PAR8] ()
    def ui_read_get_event(event)
      logger.debug do
        args = [event]
        "called ui_read_get_event with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(4)
      bytes += param_simple(event)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_TBATT = 5

    #
    # @param value [PARF] (out) Battery temperature rise [C]
    def ui_read_get_tbatt(value)
      logger.debug do
        args = [value]
        "called ui_read_get_tbatt with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(5)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_IINT = 6

    #
    # @param iint [PARF] (out) Integrated battery current [A]
    def ui_read_get_iint(iint)
      logger.debug do
        args = [iint]
        "called ui_read_get_iint with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(6)
      bytes += param_simple(iint)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_IMOTOR = 7

    #
    # @param value [PARF] (out) Motor current [A]
    def ui_read_get_imotor(value)
      logger.debug do
        args = [value]
        "called ui_read_get_imotor with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(7)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get string from terminal
    Lignite::GET_STRING = 8

    # Get string from terminal
    # @param length [PAR8] (in) Maximal length of string returned
    # @param destination [PAR8] (out) String variable or handle to string
    def ui_read_get_string(length, destination)
      logger.debug do
        args = [length, destination]
        "called ui_read_get_string with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(8)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get hardware version string
    Lignite::GET_HW_VERS = 9

    # Get hardware version string
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def ui_read_get_hw_vers(length, destination)
      logger.debug do
        args = [length, destination]
        "called ui_read_get_hw_vers with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(9)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get firmware version string
    Lignite::GET_FW_VERS = 10

    # Get firmware version string
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def ui_read_get_fw_vers(length, destination)
      logger.debug do
        args = [length, destination]
        "called ui_read_get_fw_vers with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(10)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get firmware build string
    Lignite::GET_FW_BUILD = 11

    # Get firmware build string
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def ui_read_get_fw_build(length, destination)
      logger.debug do
        args = [length, destination]
        "called ui_read_get_fw_build with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(11)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get os build string
    Lignite::GET_OS_BUILD = 12

    # Get os build string
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def ui_read_get_os_build(length, destination)
      logger.debug do
        args = [length, destination]
        "called ui_read_get_os_build with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(12)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_ADDRESS = 13

    #
    # @param value [PAR32] (out) Address from lms_cmdin
    def ui_read_get_address(value)
      logger.debug do
        args = [value]
        "called ui_read_get_address with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(13)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_CODE = 14

    #
    # @param length [PAR32] (in) Maximal code stream length
    # @param image [PAR32] (out) Address of image
    # @param global [PAR32] (out) Address of global variables
    # @param flag [PAR8] (out) Flag tells if image is ready
    def ui_read_get_code(length, image, global, flag)
      logger.debug do
        args = [length, image, global, flag]
        "called ui_read_get_code with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(14)
      bytes += param_simple(length)
      bytes += param_simple(image)
      bytes += param_simple(global)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::KEY = 15

    #
    # @param value [PAR8] (out) Key value from lms_cmdin (0 = no key)
    def ui_read_key(value)
      logger.debug do
        args = [value]
        "called ui_read_key with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(15)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_SHUTDOWN = 16

    #
    # @param flag [PAR8] ()
    def ui_read_get_shutdown(flag)
      logger.debug do
        args = [flag]
        "called ui_read_get_shutdown with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(16)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_WARNING = 17

    #
    # @param warnings [PAR8] ()
    def ui_read_get_warning(warnings)
      logger.debug do
        args = [warnings]
        "called ui_read_get_warning with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(17)
      bytes += param_simple(warnings)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get battery level in %
    Lignite::GET_LBATT = 18

    # Get battery level in %
    # @param pct [PAR8] (out) Battery level [0..100]
    def ui_read_get_lbatt(pct)
      logger.debug do
        args = [pct]
        "called ui_read_get_lbatt with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(18)
      bytes += param_simple(pct)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::TEXTBOX_READ = 21

    #
    # @param text [PAR8] ()
    # @param size [PAR32] ()
    # @param del [PAR8] ()
    # @param length [PAR8] ()
    # @param line [PAR16] ()
    # @param destination [PAR8] ()
    def ui_read_textbox_read(text, size, del, length, line, destination)
      logger.debug do
        args = [text, size, del, length, line, destination]
        "called ui_read_textbox_read with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(21)
      bytes += param_simple(text)
      bytes += param_simple(size)
      bytes += param_simple(del)
      bytes += param_simple(length)
      bytes += param_simple(line)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get version string
    Lignite::GET_VERSION = 26

    # Get version string
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def ui_read_get_version(length, destination)
      logger.debug do
        args = [length, destination]
        "called ui_read_get_version with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(26)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get IP address string
    Lignite::GET_IP = 27

    # Get IP address string
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def ui_read_get_ip(length, destination)
      logger.debug do
        args = [length, destination]
        "called ui_read_get_ip with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(27)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_POWER = 29

    #
    # @param vbatt [PARF] (out) Battery voltage [V]
    # @param ibatt [PARF] (out) Battery current [A]
    # @param iint [PARF] (out) Integrated battery current [A]
    # @param imotor [PARF] (out) Motor current [A]
    def ui_read_get_power(vbatt, ibatt, iint, imotor)
      logger.debug do
        args = [vbatt, ibatt, iint, imotor]
        "called ui_read_get_power with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(29)
      bytes += param_simple(vbatt)
      bytes += param_simple(ibatt)
      bytes += param_simple(iint)
      bytes += param_simple(imotor)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_SDCARD = 30

    #
    # @param state [PAR8] (out) SD card present [0..1]
    # @param total [PAR32] (out) Kbytes in total
    # @param free [PAR32] (out) Kbytes free
    def ui_read_get_sdcard(state, total, free)
      logger.debug do
        args = [state, total, free]
        "called ui_read_get_sdcard with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(30)
      bytes += param_simple(state)
      bytes += param_simple(total)
      bytes += param_simple(free)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_USBSTICK = 31

    #
    # @param state [PAR8] (out) USB stick present [0..1]
    # @param total [PAR32] (out) Kbytes in total
    # @param free [PAR32] (out) Kbytes free
    def ui_read_get_usbstick(state, total, free)
      logger.debug do
        args = [state, total, free]
        "called ui_read_get_usbstick with #{args.inspect}"
      end

      bytes = u8(0x81)
      bytes += param_simple(31)
      bytes += param_simple(state)
      bytes += param_simple(total)
      bytes += param_simple(free)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_UI_READ = {
      1 => :get_vbatt,
      2 => :get_ibatt,
      3 => :get_os_vers,
      4 => :get_event,
      5 => :get_tbatt,
      6 => :get_iint,
      7 => :get_imotor,
      8 => :get_string,
      9 => :get_hw_vers,
      10 => :get_fw_vers,
      11 => :get_fw_build,
      12 => :get_os_build,
      13 => :get_address,
      14 => :get_code,
      15 => :key,
      16 => :get_shutdown,
      17 => :get_warning,
      18 => :get_lbatt,
      21 => :textbox_read,
      26 => :get_version,
      27 => :get_ip,
      29 => :get_power,
      30 => :get_sdcard,
      31 => :get_usbstick,
    }.freeze

    def ui_read(*args)
      logger.debug "called ui_read with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_UI_READ.fetch(cvalue)
      __send__("ui_read_#{csym}", *args)
    end

    #
    Lignite::WRITE_FLUSH = 1

    #
    def ui_write_write_flush
      logger.debug do
        args = []
        "called ui_write_write_flush with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(1)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::FLOATVALUE = 2

    #
    # @param value [PARF] (in) Value to write
    # @param figures [PAR8] (in) Total number of figures inclusive decimal point
    # @param decimals [PAR8] (in) Number of decimals
    def ui_write_floatvalue(value, figures, decimals)
      logger.debug do
        args = [value, figures, decimals]
        "called ui_write_floatvalue with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(2)
      bytes += param_simple(value)
      bytes += param_simple(figures)
      bytes += param_simple(decimals)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::STAMP = 3

    #
    # @param value [PAR8] ()
    def ui_write_stamp(value)
      logger.debug do
        args = [value]
        "called ui_write_stamp with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(3)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::PUT_STRING = 8

    #
    # @param string [PAR8] (in) First character in string to write
    def ui_write_put_string(string)
      logger.debug do
        args = [string]
        "called ui_write_put_string with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(8)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::VALUE8 = 9

    #
    # @param value [PAR8] (in) Value to write
    def ui_write_value8(value)
      logger.debug do
        args = [value]
        "called ui_write_value8 with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(9)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::VALUE16 = 10

    #
    # @param value [PAR16] (in) Value to write
    def ui_write_value16(value)
      logger.debug do
        args = [value]
        "called ui_write_value16 with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(10)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::VALUE32 = 11

    #
    # @param value [PAR32] (in) Value to write
    def ui_write_value32(value)
      logger.debug do
        args = [value]
        "called ui_write_value32 with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(11)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::VALUEF = 12

    #
    # @param value [PARF] (in) Value to write
    def ui_write_valuef(value)
      logger.debug do
        args = [value]
        "called ui_write_valuef with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(12)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::ADDRESS = 13

    #
    # @param value [PAR32] (out)
    def ui_write_address(value)
      logger.debug do
        args = [value]
        "called ui_write_address with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(13)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::CODE = 14

    #
    # @param array [PAR8] (in) First byte in byte array to write
    # @param length [PAR32] (in) Length of array
    def ui_write_code(array, length)
      logger.debug do
        args = [array, length]
        "called ui_write_code with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(14)
      bytes += param_simple(array)
      bytes += param_simple(length)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Send to brick when file down load is completed (plays sound and updates the UI browser)
    Lignite::DOWNLOAD_END = 15

    # Send to brick when file down load is completed (plays sound and updates the UI browser)
    def ui_write_download_end
      logger.debug do
        args = []
        "called ui_write_download_end with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(15)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Set or clear screen block status (if screen blocked - all graphical screen action are disabled)
    Lignite::SCREEN_BLOCK = 16

    # Set or clear screen block status (if screen blocked - all graphical screen action are disabled)
    # @param status [PAR8] (in) Value [0 = normal,1 = blocked]
    def ui_write_screen_block(status)
      logger.debug do
        args = [status]
        "called ui_write_screen_block with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(16)
      bytes += param_simple(status)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::ALLOW_PULSE = 17

    #
    # @param value [PAR8] ()
    def ui_write_allow_pulse(value)
      logger.debug do
        args = [value]
        "called ui_write_allow_pulse with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(17)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SET_PULSE = 18

    #
    # @param value [PAR8] ()
    def ui_write_set_pulse(value)
      logger.debug do
        args = [value]
        "called ui_write_set_pulse with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(18)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Append line of text at the bottom of a text box
    Lignite::TEXTBOX_APPEND = 21

    # Append line of text at the bottom of a text box
    # @param text [PAR8] (in) First character in text box text (must be zero terminated)
    # @param size [PAR32] (in) Maximal text size (including zero termination)
    # @param del [PAR8] (in) Delimiter code
    # @param source [PAR8] (in) String variable or handle to string to append
    def ui_write_textbox_append(text, size, del, source)
      logger.debug do
        args = [text, size, del, source]
        "called ui_write_textbox_append with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(21)
      bytes += param_simple(text)
      bytes += param_simple(size)
      bytes += param_simple(del)
      bytes += param_simple(source)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SET_BUSY = 22

    #
    # @param value [PAR8] (in) Value [0,1]
    def ui_write_set_busy(value)
      logger.debug do
        args = [value]
        "called ui_write_set_busy with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(22)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SET_TESTPIN = 24

    #
    # @param state [PAR8] (in) Value [0 = low,1 = high]
    def ui_write_set_testpin(state)
      logger.debug do
        args = [state]
        "called ui_write_set_testpin with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(24)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Start the "Mindstorms" "run" screen
    Lignite::INIT_RUN = 25

    # Start the "Mindstorms" "run" screen
    def ui_write_init_run
      logger.debug do
        args = []
        "called ui_write_init_run with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(25)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::UPDATE_RUN = 26

    #
    def ui_write_update_run
      logger.debug do
        args = []
        "called ui_write_update_run with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(26)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::LED = 27

    #
    # @param pattern [PAR8] (in) LED Pattern
    def ui_write_led(pattern)
      logger.debug do
        args = [pattern]
        "called ui_write_led with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(27)
      bytes += param_simple(pattern)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::POWER = 29

    #
    # @param value [PAR8] (in) Value [0,1]
    def ui_write_power(value)
      logger.debug do
        args = [value]
        "called ui_write_power with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(29)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Update tick to scroll graph horizontally in memory when drawing graph in "scope" mode
    Lignite::GRAPH_SAMPLE = 30

    # Update tick to scroll graph horizontally in memory when drawing graph in "scope" mode
    def ui_write_graph_sample
      logger.debug do
        args = []
        "called ui_write_graph_sample with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(30)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::TERMINAL = 31

    #
    # @param state [PAR8] (in) Value [0 = Off,1 = On]
    def ui_write_terminal(state)
      logger.debug do
        args = [state]
        "called ui_write_terminal with #{args.inspect}"
      end

      bytes = u8(0x82)
      bytes += param_simple(31)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_UI_WRITE = {
      1 => :write_flush,
      2 => :floatvalue,
      3 => :stamp,
      8 => :put_string,
      9 => :value8,
      10 => :value16,
      11 => :value32,
      12 => :valuef,
      13 => :address,
      14 => :code,
      15 => :download_end,
      16 => :screen_block,
      17 => :allow_pulse,
      18 => :set_pulse,
      21 => :textbox_append,
      22 => :set_busy,
      24 => :set_testpin,
      25 => :init_run,
      26 => :update_run,
      27 => :led,
      29 => :power,
      30 => :graph_sample,
      31 => :terminal,
    }.freeze

    def ui_write(*args)
      logger.debug "called ui_write with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_UI_WRITE.fetch(cvalue)
      __send__("ui_write_#{csym}", *args)
    end

    #
    Lignite::SHORTPRESS = 1

    #
    # @param button [PAR8] (in)
    # @param state [PAR8] (out) Button has been pressed (0 = no, 1 = yes)
    def ui_button_shortpress(button, state)
      logger.debug do
        args = [button, state]
        "called ui_button_shortpress with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(1)
      bytes += param_simple(button)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::LONGPRESS = 2

    #
    # @param button [PAR8] (in)
    # @param state [PAR8] (out) Button has been pressed (0 = no, 1 = yes)
    def ui_button_longpress(button, state)
      logger.debug do
        args = [button, state]
        "called ui_button_longpress with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(2)
      bytes += param_simple(button)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::WAIT_FOR_PRESS = 3

    #
    def ui_button_wait_for_press
      logger.debug do
        args = []
        "called ui_button_wait_for_press with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(3)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::FLUSH = 4

    #
    def ui_button_flush
      logger.debug do
        args = []
        "called ui_button_flush with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(4)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::PRESS = 5

    #
    # @param button [PAR8] (in)
    def ui_button_press(button)
      logger.debug do
        args = [button]
        "called ui_button_press with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(5)
      bytes += param_simple(button)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::RELEASE = 6

    #
    # @param button [PAR8] (in)
    def ui_button_release(button)
      logger.debug do
        args = [button]
        "called ui_button_release with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(6)
      bytes += param_simple(button)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_HORZ = 7

    #
    # @param value [PAR16] (out) Horizontal arrows data (-1 = left, +1 = right, 0 = not pressed)
    def ui_button_get_horz(value)
      logger.debug do
        args = [value]
        "called ui_button_get_horz with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(7)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_VERT = 8

    #
    # @param value [PAR16] (out) Vertical arrows data (-1 = up, +1 = down, 0 = not pressed)
    def ui_button_get_vert(value)
      logger.debug do
        args = [value]
        "called ui_button_get_vert with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(8)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::PRESSED = 9

    #
    # @param button [PAR8] (in)
    # @param state [PAR8] (out) Button is pressed (0 = no, 1 = yes)
    def ui_button_pressed(button, state)
      logger.debug do
        args = [button, state]
        "called ui_button_pressed with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(9)
      bytes += param_simple(button)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SET_BACK_BLOCK = 10

    #
    # @param blocked [PAR8] (in) Set UI back button blocked flag (0 = not blocked, 1 = blocked)
    def ui_button_set_back_block(blocked)
      logger.debug do
        args = [blocked]
        "called ui_button_set_back_block with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(10)
      bytes += param_simple(blocked)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_BACK_BLOCK = 11

    #
    # @param blocked [PAR8] (out) Get UI back button blocked flag (0 = not blocked, 1 = blocked)
    def ui_button_get_back_block(blocked)
      logger.debug do
        args = [blocked]
        "called ui_button_get_back_block with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(11)
      bytes += param_simple(blocked)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::TESTSHORTPRESS = 12

    #
    # @param button [PAR8] (in)
    # @param state [PAR8] (out) Button has been hold down(0 = no, 1 = yes)
    def ui_button_testshortpress(button, state)
      logger.debug do
        args = [button, state]
        "called ui_button_testshortpress with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(12)
      bytes += param_simple(button)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::TESTLONGPRESS = 13

    #
    # @param button [PAR8] (in)
    # @param state [PAR8] (out) Button has been hold down(0 = no, 1 = yes)
    def ui_button_testlongpress(button, state)
      logger.debug do
        args = [button, state]
        "called ui_button_testlongpress with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(13)
      bytes += param_simple(button)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_BUMBED = 14

    #
    # @param button [PAR8] (in)
    # @param state [PAR8] (out) Button has been pressed (0 = no, 1 = yes)
    def ui_button_get_bumbed(button, state)
      logger.debug do
        args = [button, state]
        "called ui_button_get_bumbed with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(14)
      bytes += param_simple(button)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_BUMPED = 14

    #
    # @param button [PAR8] (in)
    # @param state [PAR8] (out) Button has been pressed (0 = no, 1 = yes)
    def ui_button_get_bumped(button, state)
      logger.debug do
        args = [button, state]
        "called ui_button_get_bumped with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(14)
      bytes += param_simple(button)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get and clear click sound request (internal use only)
    Lignite::GET_CLICK = 15

    # Get and clear click sound request (internal use only)
    # @param click [PAR8] (out) Click sound request (0 = no, 1 = yes)
    def ui_button_get_click(click)
      logger.debug do
        args = [click]
        "called ui_button_get_click with #{args.inspect}"
      end

      bytes = u8(0x83)
      bytes += param_simple(15)
      bytes += param_simple(click)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_UI_BUTTON = {
      1 => :shortpress,
      2 => :longpress,
      3 => :wait_for_press,
      4 => :flush,
      5 => :press,
      6 => :release,
      7 => :get_horz,
      8 => :get_vert,
      9 => :pressed,
      10 => :set_back_block,
      11 => :get_back_block,
      12 => :testshortpress,
      13 => :testlongpress,
      14 => :get_bumped,
      15 => :get_click,
    }.freeze

    def ui_button(*args)
      logger.debug "called ui_button with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_UI_BUTTON.fetch(cvalue)
      __send__("ui_button_#{csym}", *args)
    end

    #
    Lignite::UPDATE = 0

    #
    def ui_draw_update
      logger.debug do
        args = []
        "called ui_draw_update with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(0)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::CLEAN = 1

    #
    def ui_draw_clean
      logger.debug do
        args = []
        "called ui_draw_clean with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(1)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::PIXEL = 2

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    def ui_draw_pixel(color, x0, y0)
      logger.debug do
        args = [color, x0, y0]
        "called ui_draw_pixel with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(2)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::LINE = 3

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param x1 [PAR16] (in) X end [0..LCD_WIDTH]
    # @param y1  [PAR16] (in) Y end [0..LCD_HEIGHT]
    def ui_draw_line(color, x0, y0, x1, y1 )
      logger.debug do
        args = [color, x0, y0, x1, y1 ]
        "called ui_draw_line with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(3)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(x1)
      bytes += param_simple(y1 )
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::CIRCLE = 4

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param r [PAR16] (in) Radius
    def ui_draw_circle(color, x0, y0, r)
      logger.debug do
        args = [color, x0, y0, r]
        "called ui_draw_circle with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(4)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::TEXT = 5

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param string [PAR8] (in) First character in string to draw
    def ui_draw_text(color, x0, y0, string)
      logger.debug do
        args = [color, x0, y0, string]
        "called ui_draw_text with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(5)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::ICON = 6

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param type [PAR8] (in) Icon type (pool)
    # @param no [PAR8] (in) Icon number
    def ui_draw_icon(color, x0, y0, type, no)
      logger.debug do
        args = [color, x0, y0, type, no]
        "called ui_draw_icon with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(6)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(type)
      bytes += param_simple(no)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::PICTURE = 7

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param ip [PAR32] (in) Address of picture
    def ui_draw_picture(color, x0, y0, ip)
      logger.debug do
        args = [color, x0, y0, ip]
        "called ui_draw_picture with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(7)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(ip)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::VALUE = 8

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param value [PARF] (in) Value to write
    # @param figures [PAR8] (in) Total number of figures inclusive decimal point
    # @param decimals [PAR8] (in) Number of decimals
    def ui_draw_value(color, x0, y0, value, figures, decimals)
      logger.debug do
        args = [color, x0, y0, value, figures, decimals]
        "called ui_draw_value with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(8)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(value)
      bytes += param_simple(figures)
      bytes += param_simple(decimals)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::FILLRECT = 9

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param x1 [PAR16] (in) X size [0..LCD_WIDTH - X0]
    # @param y1  [PAR16] (in) Y size [0..LCD_HEIGHT - Y0]
    def ui_draw_fillrect(color, x0, y0, x1, y1 )
      logger.debug do
        args = [color, x0, y0, x1, y1 ]
        "called ui_draw_fillrect with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(9)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(x1)
      bytes += param_simple(y1 )
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::RECT = 10

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param x1 [PAR16] (in) X size [0..LCD_WIDTH - X0]
    # @param y1  [PAR16] (in) Y size [0..LCD_HEIGHT - Y0]
    def ui_draw_rect(color, x0, y0, x1, y1 )
      logger.debug do
        args = [color, x0, y0, x1, y1 ]
        "called ui_draw_rect with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(10)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(x1)
      bytes += param_simple(y1 )
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::RECTANGLE = 10

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param x1 [PAR16] (in) X size [0..LCD_WIDTH - X0]
    # @param y1  [PAR16] (in) Y size [0..LCD_HEIGHT - Y0]
    def ui_draw_rectangle(color, x0, y0, x1, y1 )
      logger.debug do
        args = [color, x0, y0, x1, y1 ]
        "called ui_draw_rectangle with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(10)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(x1)
      bytes += param_simple(y1 )
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::NOTIFICATION = 11

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param icon1 [PAR8] (in) First icon
    # @param icon2 [PAR8] (in) Second icon
    # @param icon3 [PAR8] (in) Third icon
    # @param string [PAR8] (in) First character in notification string
    # @param state [PAR8] (in) State 0 = INIT
    def ui_draw_notification(color, x0, y0, icon1, icon2, icon3, string, state)
      logger.debug do
        args = [color, x0, y0, icon1, icon2, icon3, string, state]
        "called ui_draw_notification with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(11)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(icon1)
      bytes += param_simple(icon2)
      bytes += param_simple(icon3)
      bytes += param_simple(string)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::QUESTION = 12

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param icon1 [PAR8] (in) First icon
    # @param icon2 [PAR8] (in) Second icon
    # @param string [PAR8] (in) First character in question string
    # @param state [PAR8] (in) State 0 = NO, 1 = OK
    # @param ok [PAR8] (out) Answer 0 = NO, 1 = OK, -1 = SKIP
    def ui_draw_question(color, x0, y0, icon1, icon2, string, state, ok)
      logger.debug do
        args = [color, x0, y0, icon1, icon2, string, state, ok]
        "called ui_draw_question with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(12)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(icon1)
      bytes += param_simple(icon2)
      bytes += param_simple(string)
      bytes += param_simple(state)
      bytes += param_simple(ok)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::KEYBOARD = 13

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param icon [PAR8] (in)
    # @param length [PAR8] (in) Maximal string length
    # @param default [PAR8] (in) Default string (0 = none)
    # @param charset [PAR8] (in) Internal use (must be a variable initialised by a "valid character set")

    # @param string [PAR8] (out) First character in string receiving keyboard input
    def ui_draw_keyboard(color, x0, y0, icon, length, default, charset, string)
      logger.debug do
        args = [color, x0, y0, icon, length, default, charset, string]
        "called ui_draw_keyboard with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(13)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(icon)
      bytes += param_simple(length)
      bytes += param_simple(default)
      bytes += param_simple(charset)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::BROWSE = 14

    #
    # @param type [PAR8] (in) Browser Types Avaliable
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param x1 [PAR16] (in) X size [0..LCD_WIDTH]
    # @param y1 [PAR16] (in) Y size [0..LCD_HEIGHT]
    # @param length [PAR8] (in) Maximal string length
    # @param item_type [PAR8] (out) Item type (folder, byte code file, sound file, ...)(must be a zero initialised variable)

    # @param string [PAR8] (out) First character in string receiving selected item name
    def ui_draw_browse(type, x0, y0, x1, y1, length, item_type, string)
      logger.debug do
        args = [type, x0, y0, x1, y1, length, item_type, string]
        "called ui_draw_browse with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(14)
      bytes += param_simple(type)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(x1)
      bytes += param_simple(y1)
      bytes += param_simple(length)
      bytes += param_simple(item_type)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::VERTBAR = 15

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param x1 [PAR16] (in) X size [0..LCD_WIDTH]
    # @param y1 [PAR16] (in) Y size [0..LCD_HEIGHT]
    # @param min [PAR16] (in) Minimum value
    # @param max [PAR16] (in) Maximum value
    # @param act [PAR16] (in) Actual value
    def ui_draw_vertbar(color, x0, y0, x1, y1, min, max, act)
      logger.debug do
        args = [color, x0, y0, x1, y1, min, max, act]
        "called ui_draw_vertbar with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(15)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(x1)
      bytes += param_simple(y1)
      bytes += param_simple(min)
      bytes += param_simple(max)
      bytes += param_simple(act)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::INVERSERECT = 16

    #
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param x1 [PAR16] (in) X size [0..LCD_WIDTH]
    # @param y1  [PAR16] (in) Y size [0..LCD_HEIGHT]
    def ui_draw_inverserect(x0, y0, x1, y1 )
      logger.debug do
        args = [x0, y0, x1, y1 ]
        "called ui_draw_inverserect with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(16)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(x1)
      bytes += param_simple(y1 )
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SELECT_FONT = 17

    #
    # @param type [PAR8] (in) Font type [0..2] font will change to 0 when UPDATE is called
    def ui_draw_select_font(type)
      logger.debug do
        args = [type]
        "called ui_draw_select_font with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(17)
      bytes += param_simple(type)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::TOPLINE = 18

    #
    # @param enable [PAR8] (in) Enable top status line (0 = disabled, 1 = enabled)
    def ui_draw_topline(enable)
      logger.debug do
        args = [enable]
        "called ui_draw_topline with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(18)
      bytes += param_simple(enable)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::FILLWINDOW = 19

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR] (Color != BG_COLOR and FG_COLOR -> test pattern)

    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param y1 [PAR16] (in) X size [0..LCD_HEIGHT]
    def ui_draw_fillwindow(color, y0, y1)
      logger.debug do
        args = [color, y0, y1]
        "called ui_draw_fillwindow with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(19)
      bytes += param_simple(color)
      bytes += param_simple(y0)
      bytes += param_simple(y1)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SCROLL = 20

    #
    # @param y [PAR16] ()
    def ui_draw_scroll(y)
      logger.debug do
        args = [y]
        "called ui_draw_scroll with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(20)
      bytes += param_simple(y)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::DOTLINE = 21

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param x1 [PAR16] (in) X end [0..LCD_WIDTH]
    # @param y1  [PAR16] (in) Y end [0..LCD_HEIGHT]
    # @param on  [PAR16] (in) On pixels
    # @param off  [PAR16] (in) Off pixels
    def ui_draw_dotline(color, x0, y0, x1, y1 , on , off )
      logger.debug do
        args = [color, x0, y0, x1, y1 , on , off ]
        "called ui_draw_dotline with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(21)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(x1)
      bytes += param_simple(y1 )
      bytes += param_simple(on )
      bytes += param_simple(off )
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::VIEW_VALUE = 22

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param value [PARF] (in) Value to write
    # @param figures [PAR8] (in) Total number of figures inclusive decimal point
    # @param decimals [PAR8] (in) Number of decimals
    def ui_draw_view_value(color, x0, y0, value, figures, decimals)
      logger.debug do
        args = [color, x0, y0, value, figures, decimals]
        "called ui_draw_view_value with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(22)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(value)
      bytes += param_simple(figures)
      bytes += param_simple(decimals)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::VIEW_UNIT = 23

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param value [PARF] (in) Value to write
    # @param figures [PAR8] (in) Total number of figures inclusive decimal point
    # @param decimals [PAR8] (in) Number of decimals
    # @param length [PAR8] (in) Maximal string length
    # @param string [PAR8] (in) First character in string to draw
    def ui_draw_view_unit(color, x0, y0, value, figures, decimals, length, string)
      logger.debug do
        args = [color, x0, y0, value, figures, decimals, length, string]
        "called ui_draw_view_unit with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(23)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(value)
      bytes += param_simple(figures)
      bytes += param_simple(decimals)
      bytes += param_simple(length)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::FILLCIRCLE = 24

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param r [PAR16] (in) Radius
    def ui_draw_fillcircle(color, x0, y0, r)
      logger.debug do
        args = [color, x0, y0, r]
        "called ui_draw_fillcircle with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(24)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::STORE = 25

    #
    # @param no [PAR8] (in) Level number
    def ui_draw_store(no)
      logger.debug do
        args = [no]
        "called ui_draw_store with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(25)
      bytes += param_simple(no)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::RESTORE = 26

    #
    # @param no [PAR8] (in) Level number (N=0 -> Saved screen just before run)
    def ui_draw_restore(no)
      logger.debug do
        args = [no]
        "called ui_draw_restore with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(26)
      bytes += param_simple(no)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::ICON_QUESTION = 27

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param state [PAR8] (in) State 0 = INIT
    # @param icons [PAR32] (in) bitfield with icons
    def ui_draw_icon_question(color, x0, y0, state, icons)
      logger.debug do
        args = [color, x0, y0, state, icons]
        "called ui_draw_icon_question with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(27)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(state)
      bytes += param_simple(icons)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::BMPFILE = 28

    #
    # @param color [PAR8] (in) Color [BG_COLOR..FG_COLOR]
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param y0 [PAR16] (in) Y start cord [0..LCD_HEIGHT]
    # @param name [PAR8] (in) First character in filename (character string)
    def ui_draw_bmpfile(color, x0, y0, name)
      logger.debug do
        args = [color, x0, y0, name]
        "called ui_draw_bmpfile with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(28)
      bytes += param_simple(color)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::POPUP = 29

    #
    # @param open [PAR8] ()
    def ui_draw_popup(open)
      logger.debug do
        args = [open]
        "called ui_draw_popup with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(29)
      bytes += param_simple(open)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GRAPH_SETUP = 30

    #
    # @param x0 [PAR16] (in) X start cord [0..LCD_WIDTH]
    # @param x1 [PAR16] (in) X size [0..LCD_WIDTH - X0]
    # @param items [PAR16] (in) Number of datasets in arrays
    # @param offset [PAR16] (in) DATA16 array (handle) containing Y start cord [0..LCD_HEIGHT]
    # @param span [PAR8] (in) DATA16 array (handle) containing Y size [0..(LCD_HEIGHT - hOFFSET[])]

    # @param min [PAR16] (in) DATAF array (handle) containing min values
    # @param max [PAR16] (in) DATAF array (handle) containing max values
    # @param sample [PAR16] (in) DATAF array (handle) containing sample values
    def ui_draw_graph_setup(x0, x1, items, offset, span, min, max, sample)
      logger.debug do
        args = [x0, x1, items, offset, span, min, max, sample]
        "called ui_draw_graph_setup with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(30)
      bytes += param_simple(x0)
      bytes += param_simple(x1)
      bytes += param_simple(items)
      bytes += param_simple(offset)
      bytes += param_simple(span)
      bytes += param_simple(min)
      bytes += param_simple(max)
      bytes += param_simple(sample)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GRAPH_DRAW = 31

    #
    # @param view [PAR8] (in) Dataset number to view (0=all)
    # @param actual [PARF] (out)
    # @param lowest [PARF] (out)
    # @param highest [PARF] (out)
    # @param average [PARF] (out)
    def ui_draw_graph_draw(view, actual, lowest, highest, average)
      logger.debug do
        args = [view, actual, lowest, highest, average]
        "called ui_draw_graph_draw with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(31)
      bytes += param_simple(view)
      bytes += param_simple(actual)
      bytes += param_simple(lowest)
      bytes += param_simple(highest)
      bytes += param_simple(average)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::TEXTBOX = 32

    #
    # @param x0 [PAR16] ()
    # @param y0 [PAR16] ()
    # @param x1 [PAR16] ()
    # @param y1 [PAR16] ()
    # @param text [PAR8] ()
    # @param size [PAR32] ()
    # @param del [PAR8] ()
    # @param line [PAR8] ()
    def ui_draw_textbox(x0, y0, x1, y1, text, size, del, line)
      logger.debug do
        args = [x0, y0, x1, y1, text, size, del, line]
        "called ui_draw_textbox with #{args.inspect}"
      end

      bytes = u8(0x84)
      bytes += param_simple(32)
      bytes += param_simple(x0)
      bytes += param_simple(y0)
      bytes += param_simple(x1)
      bytes += param_simple(y1)
      bytes += param_simple(text)
      bytes += param_simple(size)
      bytes += param_simple(del)
      bytes += param_simple(line)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_UI_DRAW = {
      0 => :update,
      1 => :clean,
      2 => :pixel,
      3 => :line,
      4 => :circle,
      5 => :text,
      6 => :icon,
      7 => :picture,
      8 => :value,
      9 => :fillrect,
      10 => :rectangle,
      11 => :notification,
      12 => :question,
      13 => :keyboard,
      14 => :browse,
      15 => :vertbar,
      16 => :inverserect,
      17 => :select_font,
      18 => :topline,
      19 => :fillwindow,
      20 => :scroll,
      21 => :dotline,
      22 => :view_value,
      23 => :view_unit,
      24 => :fillcircle,
      25 => :store,
      26 => :restore,
      27 => :icon_question,
      28 => :bmpfile,
      29 => :popup,
      30 => :graph_setup,
      31 => :graph_draw,
      32 => :textbox,
    }.freeze

    def ui_draw(*args)
      logger.debug "called ui_draw with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_UI_DRAW.fetch(cvalue)
      __send__("ui_draw_#{csym}", *args)
    end

    # Setup timer to wait TIME mS
    # @param time [PAR32] (in) Time to wait [mS]
    # @param timer [PAR32] (in) Variable used for timing
    def timer_wait(time, timer)
      logger.debug do
        args = [time, timer]
        "called timer_wait with #{args.inspect}"
      end

      bytes = u8(0x85)
      bytes += param_simple(time)
      bytes += param_simple(timer)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Wait for timer ready (wait for timeout)
    # @param timer [PAR32] (in) Variable used for timing
    def timer_ready(timer)
      logger.debug do
        args = [timer]
        "called timer_ready with #{args.inspect}"
      end

      bytes = u8(0x86)
      bytes += param_simple(timer)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read free running timer [mS]
    # @param time [PAR32] (out) Value
    def timer_read(time)
      logger.debug do
        args = [time]
        "called timer_read with #{args.inspect}"
      end

      bytes = u8(0x87)
      bytes += param_simple(time)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Display globals or object locals on terminal
    def bp0
      logger.debug do
        args = []
        "called bp0 with #{args.inspect}"
      end

      bytes = u8(0x88)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Display globals or object locals on terminal
    def bp1
      logger.debug do
        args = []
        "called bp1 with #{args.inspect}"
      end

      bytes = u8(0x89)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Display globals or object locals on terminal
    def bp2
      logger.debug do
        args = []
        "called bp2 with #{args.inspect}"
      end

      bytes = u8(0x8A)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Display globals or object locals on terminal
    def bp3
      logger.debug do
        args = []
        "called bp3 with #{args.inspect}"
      end

      bytes = u8(0x8B)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set break point in byte code program
    # @param prgid [PAR16] (in) Program slot number
    # @param no [PAR8] (in) Breakpoint number [0..2] (3 = trigger out on TP4)
    # @param address [PAR32] (in) Address (Offset from start of image) (0 = remove breakpoint)
    def bp_set(prgid, no, address)
      logger.debug do
        args = [prgid, no, address]
        "called bp_set with #{args.inspect}"
      end

      bytes = u8(0x8C)
      bytes += param_simple(prgid)
      bytes += param_simple(no)
      bytes += param_simple(address)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # e^x            r = expf(x)
    Lignite::EXP = 1

    # e^x            r = expf(x)
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_exp(x, r)
      logger.debug do
        args = [x, r]
        "called math_exp with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(1)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Modulo         r = fmod(x,y)
    Lignite::MOD = 2

    # Modulo         r = fmod(x,y)
    # @param x [PARF] (in)
    # @param y [PARF] (in)
    # @param r [PARF] (out)
    def math_mod(x, y, r)
      logger.debug do
        args = [x, y, r]
        "called math_mod with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(2)
      bytes += param_simple(x)
      bytes += param_simple(y)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Floor          r = floor(x)
    Lignite::FLOOR = 3

    # Floor          r = floor(x)
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_floor(x, r)
      logger.debug do
        args = [x, r]
        "called math_floor with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(3)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Ceiling        r = ceil(x)
    Lignite::CEIL = 4

    # Ceiling        r = ceil(x)
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_ceil(x, r)
      logger.debug do
        args = [x, r]
        "called math_ceil with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(4)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Round          r = round(x)
    Lignite::ROUND = 5

    # Round          r = round(x)
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_round(x, r)
      logger.debug do
        args = [x, r]
        "called math_round with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(5)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Absolute       r = fabs(x)
    Lignite::ABS = 6

    # Absolute       r = fabs(x)
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_abs(x, r)
      logger.debug do
        args = [x, r]
        "called math_abs with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(6)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Negate         r = 0.0 - x
    Lignite::NEGATE = 7

    # Negate         r = 0.0 - x
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_negate(x, r)
      logger.debug do
        args = [x, r]
        "called math_negate with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(7)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Squareroot     r = sqrt(x)
    Lignite::SQRT = 8

    # Squareroot     r = sqrt(x)
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_sqrt(x, r)
      logger.debug do
        args = [x, r]
        "called math_sqrt with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(8)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Log            r = log10(x)
    Lignite::LOG = 9

    # Log            r = log10(x)
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_log(x, r)
      logger.debug do
        args = [x, r]
        "called math_log with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(9)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Ln             r = log(x)
    Lignite::LN = 10

    # Ln             r = log(x)
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_ln(x, r)
      logger.debug do
        args = [x, r]
        "called math_ln with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(10)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Sin (R = sinf(X))
    Lignite::SIN = 11

    # Sin (R = sinf(X))
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_sin(x, r)
      logger.debug do
        args = [x, r]
        "called math_sin with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(11)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Cos (R = cos(X))
    Lignite::COS = 12

    # Cos (R = cos(X))
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_cos(x, r)
      logger.debug do
        args = [x, r]
        "called math_cos with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(12)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Tan (R = tanf(X))
    Lignite::TAN = 13

    # Tan (R = tanf(X))
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_tan(x, r)
      logger.debug do
        args = [x, r]
        "called math_tan with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(13)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # ASin (R = asinf(X))
    Lignite::ASIN = 14

    # ASin (R = asinf(X))
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_asin(x, r)
      logger.debug do
        args = [x, r]
        "called math_asin with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(14)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # ACos (R = acos(X))
    Lignite::ACOS = 15

    # ACos (R = acos(X))
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_acos(x, r)
      logger.debug do
        args = [x, r]
        "called math_acos with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(15)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # ATan (R = atanf(X))
    Lignite::ATAN = 16

    # ATan (R = atanf(X))
    # @param x [PARF] (in)
    # @param r [PARF] (out)
    def math_atan(x, r)
      logger.debug do
        args = [x, r]
        "called math_atan with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(16)
      bytes += param_simple(x)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Modulo DATA8   r = x % y
    Lignite::MOD8 = 17

    # Modulo DATA8   r = x % y
    # @param x [PAR8] (in)
    # @param y [PAR8] (in)
    # @param r [PAR8] (out)
    def math_mod8(x, y, r)
      logger.debug do
        args = [x, y, r]
        "called math_mod8 with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(17)
      bytes += param_simple(x)
      bytes += param_simple(y)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Modulo DATA16  r = x % y
    Lignite::MOD16 = 18

    # Modulo DATA16  r = x % y
    # @param x [PAR16] (in)
    # @param y [PAR16] (in)
    # @param r [PAR16] (out)
    def math_mod16(x, y, r)
      logger.debug do
        args = [x, y, r]
        "called math_mod16 with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(18)
      bytes += param_simple(x)
      bytes += param_simple(y)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Modulo DATA32  r = x % y
    Lignite::MOD32 = 19

    # Modulo DATA32  r = x % y
    # @param x [PAR32] (in)
    # @param y [PAR32] (in)
    # @param r [PAR32] (out)
    def math_mod32(x, y, r)
      logger.debug do
        args = [x, y, r]
        "called math_mod32 with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(19)
      bytes += param_simple(x)
      bytes += param_simple(y)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Exponent       r = powf(x,y)
    Lignite::POW = 20

    # Exponent       r = powf(x,y)
    # @param x [PARF] (in)
    # @param y [PARF] (in)
    # @param r [PARF] (out)
    def math_pow(x, y, r)
      logger.debug do
        args = [x, y, r]
        "called math_pow with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(20)
      bytes += param_simple(x)
      bytes += param_simple(y)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Truncate       r = (float)((int)(x * pow(y))) / pow(y)
    Lignite::TRUNC = 21

    # Truncate       r = (float)((int)(x * pow(y))) / pow(y)
    # @param x [PARF] (in) Value
    # @param p [PAR8] (in) Precision [0..9]
    # @param r [PARF] (out) Result
    def math_trunc(x, p, r)
      logger.debug do
        args = [x, p, r]
        "called math_trunc with #{args.inspect}"
      end

      bytes = u8(0x8D)
      bytes += param_simple(21)
      bytes += param_simple(x)
      bytes += param_simple(p)
      bytes += param_simple(r)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_MATH = {
      1 => :exp,
      2 => :mod,
      3 => :floor,
      4 => :ceil,
      5 => :round,
      6 => :abs,
      7 => :negate,
      8 => :sqrt,
      9 => :log,
      10 => :ln,
      11 => :sin,
      12 => :cos,
      13 => :tan,
      14 => :asin,
      15 => :acos,
      16 => :atan,
      17 => :mod8,
      18 => :mod16,
      19 => :mod32,
      20 => :pow,
      21 => :trunc,
    }.freeze

    def math(*args)
      logger.debug "called math with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_MATH.fetch(cvalue)
      __send__("math_#{csym}", *args)
    end

    # Get random value
    # @param min [PAR16] (in) Minimum value
    # @param max [PAR16] (in) Maximum value
    # @param value [PAR16] (out) value
    def random(min, max, value)
      logger.debug do
        args = [min, max, value]
        "called random with #{args.inspect}"
      end

      bytes = u8(0x8E)
      bytes += param_simple(min)
      bytes += param_simple(max)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read free running timer [uS]
    # @param time [PAR32] (out) Value
    def timer_read_us(time)
      logger.debug do
        args = [time]
        "called timer_read_us with #{args.inspect}"
      end

      bytes = u8(0x8F)
      bytes += param_simple(time)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Keep alive
    # @param minutes [PAR8] (out) Number of minutes before sleep
    def keep_alive(minutes)
      logger.debug do
        args = [minutes]
        "called keep_alive with #{args.inspect}"
      end

      bytes = u8(0x90)
      bytes += param_simple(minutes)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    #
    Lignite::COMMAND = 14

    #
    # @param length [PAR32] (in) Maximal code stream length
    # @param image [PAR32] (out) Address of image
    # @param global [PAR32] (out) Address of global variables
    # @param flag [PAR8] (out) Flag that tells if image is ready
    def com_read_command(length, image, global, flag)
      logger.debug do
        args = [length, image, global, flag]
        "called com_read_command with #{args.inspect}"
      end

      bytes = u8(0x91)
      bytes += param_simple(14)
      bytes += param_simple(length)
      bytes += param_simple(image)
      bytes += param_simple(global)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_COM_READ = {
      14 => :command,
    }.freeze

    def com_read(*args)
      logger.debug "called com_read with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_COM_READ.fetch(cvalue)
      __send__("com_read_#{csym}", *args)
    end

    #
    Lignite::REPLY = 14

    #
    # @param image [PAR32] (in) Address of image
    # @param global [PAR32] (in) Address of global variables
    # @param status [PAR8] (in) Status
    def com_write_reply(image, global, status)
      logger.debug do
        args = [image, global, status]
        "called com_write_reply with #{args.inspect}"
      end

      bytes = u8(0x92)
      bytes += param_simple(14)
      bytes += param_simple(image)
      bytes += param_simple(global)
      bytes += param_simple(status)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_COM_WRITE = {
      14 => :reply,
    }.freeze

    def com_write(*args)
      logger.debug "called com_write with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_COM_WRITE.fetch(cvalue)
      __send__("com_write_#{csym}", *args)
    end

    #
    Lignite::BREAK = 0

    #
    def sound_break
      logger.debug do
        args = []
        "called sound_break with #{args.inspect}"
      end

      bytes = u8(0x94)
      bytes += param_simple(0)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::TONE = 1

    #
    # @param volume [PAR8] (in) Volume [0..100]
    # @param frequency [PAR16] (in) Frequency [Hz]
    # @param duration [PAR16] (in) Duration [mS]
    def sound_tone(volume, frequency, duration)
      logger.debug do
        args = [volume, frequency, duration]
        "called sound_tone with #{args.inspect}"
      end

      bytes = u8(0x94)
      bytes += param_simple(1)
      bytes += param_simple(volume)
      bytes += param_simple(frequency)
      bytes += param_simple(duration)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::PLAY = 2

    # Could not define sound_play: Unhandled param type PARS
    #
    Lignite::REPEAT = 3

    # Could not define sound_repeat: Unhandled param type PARS
    #
    Lignite::SERVICE = 4

    #
    def sound_service
      logger.debug do
        args = []
        "called sound_service with #{args.inspect}"
      end

      bytes = u8(0x94)
      bytes += param_simple(4)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_SOUND = {
      0 => :break,
      1 => :tone,
      2 => :play,
      3 => :repeat,
      4 => :service,
    }.freeze

    def sound(*args)
      logger.debug "called sound with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_SOUND.fetch(cvalue)
      __send__("sound_#{csym}", *args)
    end

    # Test if sound busy (playing file or tone
    # @param busy [PAR8] (out) Sound busy flag (0 = ready, 1 = busy)
    def sound_test(busy)
      logger.debug do
        args = [busy]
        "called sound_test with #{args.inspect}"
      end

      bytes = u8(0x95)
      bytes += param_simple(busy)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Wait for sound ready (wait until sound finished)
    def sound_ready
      logger.debug do
        args = []
        "called sound_ready with #{args.inspect}"
      end

      bytes = u8(0x96)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Sample devices
    # @param time [PAR32] (in) Sample time [mS]
    # @param samples [PAR16] (in) Number of samples
    # @param init [PAR16] (in) DATA16 array (handle) - to start/reset buffer -> fill array with -1 otherwise don't change

    # @param devices [PAR8] (in) DATA8 array (handle) with devices to sample
    # @param types [PAR8] (in) DATA8 array (handle) with types
    # @param modes [PAR8] (in) DATA8 array (handle) with modes
    # @param datasets [PAR8] (in) DATA8 array (handle) with data sets
    # @param values [PARF] (out) DATAF array (handle) with values
    def input_sample(time, samples, init, devices, types, modes, datasets, values)
      logger.debug do
        args = [time, samples, init, devices, types, modes, datasets, values]
        "called input_sample with #{args.inspect}"
      end

      bytes = u8(0x97)
      bytes += param_simple(time)
      bytes += param_simple(samples)
      bytes += param_simple(init)
      bytes += param_simple(devices)
      bytes += param_simple(types)
      bytes += param_simple(modes)
      bytes += param_simple(datasets)
      bytes += param_simple(values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read all available devices on input and output(chain)
    # @param length [PAR8] (in) Maximum number of device types (normally 32)
    # @param array [PAR8] (out) First element of DATA8 array of types (normally 32)
    # @param changed [PAR8] (out) Changed status
    def input_device_list(length, array, changed)
      logger.debug do
        args = [length, array, changed]
        "called input_device_list with #{args.inspect}"
      end

      bytes = u8(0x98)
      bytes += param_simple(length)
      bytes += param_simple(array)
      bytes += param_simple(changed)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Insert type in table
    Lignite::INSERT_TYPE = 1

    # Insert type in table
    # @param typedata [PAR8] (in) String variable or handle to string containing type data
    # @param force [PAR8] (in) Force type insert even if present (0 = don't force, 1 = force)
    # @param error [PAR8] (out) Error if not Third Party type (0 = no error, 1 = error or known)
    def input_device_insert_type(typedata, force, error)
      logger.debug do
        args = [typedata, force, error]
        "called input_device_insert_type with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(1)
      bytes += param_simple(typedata)
      bytes += param_simple(force)
      bytes += param_simple(error)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_FORMAT = 2

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param datasets [PAR8] (out) Number of data sets
    # @param format [PAR8] (out) Format [0..3]
    # @param modes [PAR8] (out) Number of modes [1..8]
    # @param views [PAR8] (out) Number of views [1..8]
    def input_device_get_format(layer, no, datasets, format, modes, views)
      logger.debug do
        args = [layer, no, datasets, format, modes, views]
        "called input_device_get_format with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(2)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(datasets)
      bytes += param_simple(format)
      bytes += param_simple(modes)
      bytes += param_simple(views)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Apply new minimum and maximum raw value for device type to be used in scaling PCT and SI
    Lignite::CAL_MINMAX = 3

    # Apply new minimum and maximum raw value for device type to be used in scaling PCT and SI
    # @param type [PAR8] (in) Device type id from typedata.rcf
    # @param mode [PAR8] (in) Device mode [0..7]
    # @param cal_min [PAR32] (in) 32 bit raw minimum value (Zero)
    # @param cal_max [PAR32] (in) 32 bit raw maximum value (Full scale)
    def input_device_cal_minmax(type, mode, cal_min, cal_max)
      logger.debug do
        args = [type, mode, cal_min, cal_max]
        "called input_device_cal_minmax with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(3)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_simple(cal_min)
      bytes += param_simple(cal_max)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Apply the default minimum and maximum raw value for device type to be used in scaling PCT and SI
    Lignite::CAL_DEFAULT = 4

    # Apply the default minimum and maximum raw value for device type to be used in scaling PCT and SI
    # @param type [PAR8] (in) Device type id from typedata.rcf
    # @param mode [PAR8] (in) Device mode [0..7]
    def input_device_cal_default(type, mode)
      logger.debug do
        args = [type, mode]
        "called input_device_cal_default with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(4)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get device type and mode
    Lignite::GET_TYPEMODE = 5

    # Get device type and mode
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param type [PAR8] (out) Device type id from typedata.rcf
    # @param mode [PAR8] (out) Device mode [0..7]
    def input_device_get_typemode(layer, no, type, mode)
      logger.debug do
        args = [layer, no, type, mode]
        "called input_device_get_typemode with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(5)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_SYMBOL = 6

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def input_device_get_symbol(layer, no, length, destination)
      logger.debug do
        args = [layer, no, length, destination]
        "called input_device_get_symbol with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(6)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Apply new minimum raw value for device type to be used in scaling PCT and SI
    Lignite::CAL_MIN = 7

    # Apply new minimum raw value for device type to be used in scaling PCT and SI
    # @param type [PAR8] (in) Device type id from typedata.rcf
    # @param mode [PAR8] (in) Device mode [0..7]
    # @param cal_min [PAR32] (in) 32 bit raw minimum value (Zero)
    def input_device_cal_min(type, mode, cal_min)
      logger.debug do
        args = [type, mode, cal_min]
        "called input_device_cal_min with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(7)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_simple(cal_min)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Apply new maximum raw value for device type to be used in scaling PCT and SI
    Lignite::CAL_MAX = 8

    # Apply new maximum raw value for device type to be used in scaling PCT and SI
    # @param type [PAR8] (in) Device type id from typedata.rcf
    # @param mode [PAR8] (in) Device mode [0..7]
    # @param cal_max [PAR32] (in) 32 bit SI maximum value (Full scale)
    def input_device_cal_max(type, mode, cal_max)
      logger.debug do
        args = [type, mode, cal_max]
        "called input_device_cal_max with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(8)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_simple(cal_max)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Generic setup/read IIC sensors
    Lignite::SETUP = 9

    # Generic setup/read IIC sensors
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param repeat [PAR8] (in) Repeat setup/read "REPEAT" times (0 = infinite)
    # @param time [PAR16] (in) Time between repeats [10..1000mS] (0 = 10)
    # @param write_len [PAR8] (in) No of bytes to write
    # @param write_data [PAR8] (in) DATA8 array (handle) of data to write
    # @param read_len [PAR8] (in) No of bytes to read
    # @param read_data [PAR8] (out) DATA8 array (handle) to read into
    def input_device_setup(layer, no, repeat, time, write_len, write_data, read_len, read_data)
      logger.debug do
        args = [layer, no, repeat, time, write_len, write_data, read_len, read_data]
        "called input_device_setup with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(9)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(repeat)
      bytes += param_simple(time)
      bytes += param_simple(write_len)
      bytes += param_simple(write_data)
      bytes += param_simple(read_len)
      bytes += param_simple(read_data)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Clear all devices (e.c. counters, angle, ...)
    Lignite::CLR_ALL = 10

    # Clear all devices (e.c. counters, angle, ...)
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    def input_device_clr_all(layer)
      logger.debug do
        args = [layer]
        "called input_device_clr_all with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(10)
      bytes += param_simple(layer)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_RAW = 11

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param value [PAR32] (out) 32 bit raw value
    def input_device_get_raw(layer, no, value)
      logger.debug do
        args = [layer, no, value]
        "called input_device_get_raw with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(11)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get device connection type (for test)
    Lignite::GET_CONNECTION = 12

    # Get device connection type (for test)
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param conn [PAR8] (out) Connection type
    def input_device_get_connection(layer, no, conn)
      logger.debug do
        args = [layer, no, conn]
        "called input_device_get_connection with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(12)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(conn)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Stop all devices (e.c. motors, ...)
    Lignite::STOP_ALL = 13

    # Stop all devices (e.c. motors, ...)
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    def input_device_stop_all(layer)
      logger.debug do
        args = [layer]
        "called input_device_stop_all with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(13)
      bytes += param_simple(layer)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Set new type and mode on existing devices
    Lignite::SET_TYPEMODE = 14

    # Set new type and mode on existing devices
    # @param type [PAR8] (in) Existing type
    # @param mode [PAR8] (in) Existing mode
    # @param newtype [PAR8] (in) New type
    # @param newmode [PAR8] (in) New mode
    # @param error [PAR8] (out) Error if not Third Party type (0 = no error, 1 = error or not found)

    def input_device_set_typemode(type, mode, newtype, newmode, error)
      logger.debug do
        args = [type, mode, newtype, newmode, error]
        "called input_device_set_typemode with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(14)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_simple(newtype)
      bytes += param_simple(newmode)
      bytes += param_simple(error)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Generic setup/read IIC sensors with result
    Lignite::READY_IIC = 15

    # Generic setup/read IIC sensors with result
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param wrlng [PAR8] (in) No of bytes to write
    # @param wrdata [PAR8] (in) DATA8 array  (handle) of data to write
    # @param rdlng [PAR8] (in) No of bytes to read (if negative -> byte order is reversed)
    # @param rddata [PAR8] (out) DATA8 array  (handle) to read into
    # @param result [PAR8] (out) Write/read result (OK, FAIL)
    def input_device_ready_iic(layer, no, wrlng, wrdata, rdlng, rddata, result)
      logger.debug do
        args = [layer, no, wrlng, wrdata, rdlng, rddata, result]
        "called input_device_ready_iic with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(15)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(wrlng)
      bytes += param_simple(wrdata)
      bytes += param_simple(rdlng)
      bytes += param_simple(rddata)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_NAME = 21

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def input_device_get_name(layer, no, length, destination)
      logger.debug do
        args = [layer, no, length, destination]
        "called input_device_get_name with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(21)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_MODENAME = 22

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param mode [PAR8] (in) Mode
    # @param length [PAR8] (in) Maximal length of string returned (-1 = no check)
    # @param destination [PAR8] (out) String variable or handle to string
    def input_device_get_modename(layer, no, mode, length, destination)
      logger.debug do
        args = [layer, no, mode, length, destination]
        "called input_device_get_modename with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(22)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(mode)
      bytes += param_simple(length)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SET_RAW = 23

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param type [PAR8] (in) Device type id (0 = don't change type)
    # @param value [PAR32] (in)
    def input_device_set_raw(layer, no, type, value)
      logger.debug do
        args = [layer, no, type, value]
        "called input_device_set_raw with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(23)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_FIGURES = 24

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param figures [PAR8] (out) Total number of figures (inclusive decimal point and decimals)
    # @param decimals [PAR8] (out) Number of decimals
    def input_device_get_figures(layer, no, figures, decimals)
      logger.debug do
        args = [layer, no, figures, decimals]
        "called input_device_get_figures with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(24)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(figures)
      bytes += param_simple(decimals)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_CHANGES = 25

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param value [PARF] (out) Positive changes since last clear
    def input_device_get_changes(layer, no, value)
      logger.debug do
        args = [layer, no, value]
        "called input_device_get_changes with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(25)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Clear changes and bumps
    Lignite::CLR_CHANGES = 26

    # Clear changes and bumps
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    def input_device_clr_changes(layer, no)
      logger.debug do
        args = [layer, no]
        "called input_device_clr_changes with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(26)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::READY_PCT = 27

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param type [PAR8] (in) Device type id (0 = don't change type)
    # @param mode [PAR8] (in) Device mode [0..7] (-1 = don't change mode)
    # @param values [PARNO] (in) Number of return values
    def input_device_ready_pct(layer, no, type, mode, *values)
      logger.debug do
        args = [layer, no, type, mode, *values]
        "called input_device_ready_pct with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(27)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_n_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::READY_RAW = 28

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param type [PAR8] (in) Device type id (0 = don't change type)
    # @param mode [PAR8] (in) Device mode [0..7] (-1 = don't change mode)
    # @param values [PARNO] (in) Number of return values
    def input_device_ready_raw(layer, no, type, mode, *values)
      logger.debug do
        args = [layer, no, type, mode, *values]
        "called input_device_ready_raw with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(28)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_n_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::READY_SI = 29

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param type [PAR8] (in) Device type id (0 = don't change type)
    # @param mode [PAR8] (in) Device mode [0..7] (-1 = don't change mode)
    # @param values [PARNO] (in) Number of return values
    def input_device_ready_si(layer, no, type, mode, *values)
      logger.debug do
        args = [layer, no, type, mode, *values]
        "called input_device_ready_si with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(29)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_n_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_MINMAX = 30

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param min [PARF] (out) Min SI value
    # @param max [PARF] (out) Max SI value
    def input_device_get_minmax(layer, no, min, max)
      logger.debug do
        args = [layer, no, min, max]
        "called input_device_get_minmax with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(30)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(min)
      bytes += param_simple(max)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_BUMPS = 31

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param value [PARF] (out) Negative changes since last clear
    def input_device_get_bumps(layer, no, value)
      logger.debug do
        args = [layer, no, value]
        "called input_device_get_bumps with #{args.inspect}"
      end

      bytes = u8(0x99)
      bytes += param_simple(31)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_INPUT_DEVICE = {
      1 => :insert_type,
      2 => :get_format,
      3 => :cal_minmax,
      4 => :cal_default,
      5 => :get_typemode,
      6 => :get_symbol,
      7 => :cal_min,
      8 => :cal_max,
      9 => :setup,
      10 => :clr_all,
      11 => :get_raw,
      12 => :get_connection,
      13 => :stop_all,
      14 => :set_typemode,
      15 => :ready_iic,
      21 => :get_name,
      22 => :get_modename,
      23 => :set_raw,
      24 => :get_figures,
      25 => :get_changes,
      26 => :clr_changes,
      27 => :ready_pct,
      28 => :ready_raw,
      29 => :ready_si,
      30 => :get_minmax,
      31 => :get_bumps,
    }.freeze

    def input_device(*args)
      logger.debug "called input_device with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_INPUT_DEVICE.fetch(cvalue)
      __send__("input_device_#{csym}", *args)
    end

    # Read device value in Percent
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param type [PAR8] (in) Device type id (0 = don't change type)
    # @param mode [PAR8] (in) Device mode [0..7] (-1 = don't change mode)
    # @param pct [PAR8] (out) Percent value from device
    def input_read(layer, no, type, mode, pct)
      logger.debug do
        args = [layer, no, type, mode, pct]
        "called input_read with #{args.inspect}"
      end

      bytes = u8(0x9A)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_simple(pct)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Test if device busy (changing type or mode)
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param busy [PAR8] (out) Device busy flag (0 = ready, 1 = busy)
    def input_test(layer, no, busy)
      logger.debug do
        args = [layer, no, busy]
        "called input_test with #{args.inspect}"
      end

      bytes = u8(0x9B)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(busy)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Wait for device ready (wait for valid data)
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    def input_ready(layer, no)
      logger.debug do
        args = [layer, no]
        "called input_ready with #{args.inspect}"
      end

      bytes = u8(0x9C)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read device value in SI units
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param type [PAR8] (in) Device type id (0 = don't change type)
    # @param mode [PAR8] (in) Device mode [0..7] (-1 = don't change mode)
    # @param si [PARF] (out) SI unit value from device
    def input_readsi(layer, no, type, mode, si)
      logger.debug do
        args = [layer, no, type, mode, si]
        "called input_readsi with #{args.inspect}"
      end

      bytes = u8(0x9D)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_simple(si)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read device value
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param type [PAR8] (in) Device type id (0 = don't change type)
    # @param mode [PAR8] (in) Device mode [0..7] (-1 = don't change mode)
    # @param format [PAR8] (in) Format (PCT, RAW, SI ...)
    # @param values [PARNO] (in) Number of return values
    def input_readext(layer, no, type, mode, format, *values)
      logger.debug do
        args = [layer, no, type, mode, format, *values]
        "called input_readext with #{args.inspect}"
      end

      bytes = u8(0x9E)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      bytes += param_simple(mode)
      bytes += param_simple(format)
      bytes += param_n_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Write data to device (only UART devices)
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param bytes [PAR8] (in) No of bytes to write [1..32]
    # @param data [PAR8] (in) First byte in DATA8 array to write
    def input_write(layer, no, bytes, data)
      logger.debug do
        args = [layer, no, bytes, data]
        "called input_write with #{args.inspect}"
      end

      bytes = u8(0x9F)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(bytes)
      bytes += param_simple(data)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param type [PAR8] (out)
    def output_get_type(layer, no, type)
      logger.debug do
        args = [layer, no, type]
        "called output_get_type with #{args.inspect}"
      end

      bytes = u8(0xA0)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set output type
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) Output no [0..3]
    # @param type [PAR8] (out) Device type id from typedata.rcf
    def output_set_type(layer, no, type)
      logger.debug do
        args = [layer, no, type]
        "called output_set_type with #{args.inspect}"
      end

      bytes = u8(0xA1)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(type)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Resets the Tacho counts
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    def output_reset(layer, nos)
      logger.debug do
        args = [layer, nos]
        "called output_reset with #{args.inspect}"
      end

      bytes = u8(0xA2)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Stops the outputs
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param brake [PAR8] (in) 0 = Coast, 1 = BRAKE
    def output_stop(layer, nos, brake)
      logger.debug do
        args = [layer, nos, brake]
        "called output_stop with #{args.inspect}"
      end

      bytes = u8(0xA3)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(brake)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set power of the outputs
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param power [PAR8] (in) Power [-100..100%]
    def output_power(layer, nos, power)
      logger.debug do
        args = [layer, nos, power]
        "called output_power with #{args.inspect}"
      end

      bytes = u8(0xA4)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(power)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set speed of the outputs
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param speed [PAR8] (in) Speed [-100..100%]
    def output_speed(layer, nos, speed)
      logger.debug do
        args = [layer, nos, speed]
        "called output_speed with #{args.inspect}"
      end

      bytes = u8(0xA5)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(speed)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Starts the outputs
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    def output_start(layer, nos)
      logger.debug do
        args = [layer, nos]
        "called output_start with #{args.inspect}"
      end

      bytes = u8(0xA6)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set polarity of the outputs
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param pol [PAR8] (in) Polarity [-1,0,1]
    def output_polarity(layer, nos, pol)
      logger.debug do
        args = [layer, nos, pol]
        "called output_polarity with #{args.inspect}"
      end

      bytes = u8(0xA7)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(pol)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param no [PAR8] (in) NO - Output no [0..3]
    # @param speed [PAR8] (out) Speed [-100..100%]
    # @param tacho [PAR32] (out) Tacho pulses [-MAX .. +MAX]
    def output_read(layer, no, speed, tacho)
      logger.debug do
        args = [layer, no, speed, tacho]
        "called output_read with #{args.inspect}"
      end

      bytes = u8(0xA8)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(speed)
      bytes += param_simple(tacho)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Testing if output is not used
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param busy [PAR8] (out) Output busy flag (0 = ready, 1 = Busy)
    def output_test(layer, nos, busy)
      logger.debug do
        args = [layer, nos, busy]
        "called output_test with #{args.inspect}"
      end

      bytes = u8(0xA9)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(busy)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Wait for output ready (wait for completion)
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    def output_ready(layer, nos)
      logger.debug do
        args = [layer, nos]
        "called output_ready with #{args.inspect}"
      end

      bytes = u8(0xAA)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param pos [PAR32] (out)
    def output_position(layer, nos, pos)
      logger.debug do
        args = [layer, nos, pos]
        "called output_position with #{args.inspect}"
      end

      bytes = u8(0xAB)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(pos)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set Ramp up, constant and rampdown steps and power of the outputs
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param power [PAR8] (in) Power [-100..100%]
    # @param step1 [PAR32] (in) Tacho pulses [0..MAX]
    # @param step2 [PAR32] (in) Tacho pulses [0..MAX]
    # @param step3 [PAR32] (in) Tacho pulses [0..MAX]
    # @param brake [PAR8] (in) 0 = Coast, 1 = BRAKE
    def output_step_power(layer, nos, power, step1, step2, step3, brake)
      logger.debug do
        args = [layer, nos, power, step1, step2, step3, brake]
        "called output_step_power with #{args.inspect}"
      end

      bytes = u8(0xAC)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(power)
      bytes += param_simple(step1)
      bytes += param_simple(step2)
      bytes += param_simple(step3)
      bytes += param_simple(brake)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set Ramp up, constant and rampdown steps and power of the outputs
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param power [PAR8] (in) Power [-100..100%]
    # @param time1 [PAR32] (in) Time in Ms [0..MAX]
    # @param time2 [PAR32] (in) Time in Ms [0..MAX]
    # @param time3 [PAR32] (in) Time in Ms [0..MAX]
    # @param brake [PAR8] (in) 0 = Coast, 1 = BRAKE
    def output_time_power(layer, nos, power, time1, time2, time3, brake)
      logger.debug do
        args = [layer, nos, power, time1, time2, time3, brake]
        "called output_time_power with #{args.inspect}"
      end

      bytes = u8(0xAD)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(power)
      bytes += param_simple(time1)
      bytes += param_simple(time2)
      bytes += param_simple(time3)
      bytes += param_simple(brake)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set Ramp up, constant and rampdown steps and power of the outputs
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param speed [PAR8] (in) Speed [-100..100%]
    # @param step1 [PAR32] (in) Tacho pulses [0..MAX]
    # @param step2 [PAR32] (in) Tacho pulses [0..MAX]
    # @param step3 [PAR32] (in) Tacho pulses [0..MAX]
    # @param brake [PAR8] (in) 0 = Coast, 1 = BRAKE
    def output_step_speed(layer, nos, speed, step1, step2, step3, brake)
      logger.debug do
        args = [layer, nos, speed, step1, step2, step3, brake]
        "called output_step_speed with #{args.inspect}"
      end

      bytes = u8(0xAE)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(speed)
      bytes += param_simple(step1)
      bytes += param_simple(step2)
      bytes += param_simple(step3)
      bytes += param_simple(brake)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set Ramp up, constant and rampdown steps and power of the outputs
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param speed [PAR8] (in) Speed [-100..100%]
    # @param time1 [PAR32] (in) Time in Ms [0..MAX]
    # @param time2 [PAR32] (in) Time in Ms [0..MAX]
    # @param time3 [PAR32] (in) Time in Ms [0..MAX]
    # @param brake [PAR8] (in) 0 = Coast, 1 = BRAKE
    def output_time_speed(layer, nos, speed, time1, time2, time3, brake)
      logger.debug do
        args = [layer, nos, speed, time1, time2, time3, brake]
        "called output_time_speed with #{args.inspect}"
      end

      bytes = u8(0xAF)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(speed)
      bytes += param_simple(time1)
      bytes += param_simple(time2)
      bytes += param_simple(time3)
      bytes += param_simple(brake)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param speed [PAR8] (in) Speed [-100..100%]
    # @param turn [PAR16] (in) Turn Ratio [-200..200]
    # @param step [PAR32] (in) Tacho Pulses [0..MAX]
    # @param brake [PAR8] (in) 0 = Coast, 1 = BRAKE
    def output_step_sync(layer, nos, speed, turn, step, brake)
      logger.debug do
        args = [layer, nos, speed, turn, step, brake]
        "called output_step_sync with #{args.inspect}"
      end

      bytes = u8(0xB0)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(speed)
      bytes += param_simple(turn)
      bytes += param_simple(step)
      bytes += param_simple(brake)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    #
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param speed [PAR8] (in) Speed [-100..100%]
    # @param turn [PAR16] (in) Turn Ratio [-200..200]
    # @param time [PAR32] (in) Time in ms [0..MAX]
    # @param brake [PAR8] (in) 0 = Coast, 1 = BRAKE
    def output_time_sync(layer, nos, speed, turn, time, brake)
      logger.debug do
        args = [layer, nos, speed, turn, time, brake]
        "called output_time_sync with #{args.inspect}"
      end

      bytes = u8(0xB1)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(speed)
      bytes += param_simple(turn)
      bytes += param_simple(time)
      bytes += param_simple(brake)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Clearing tacho count when used as sensor
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    def output_clr_count(layer, nos)
      logger.debug do
        args = [layer, nos]
        "called output_clr_count with #{args.inspect}"
      end

      bytes = u8(0xB2)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Getting tacho count when used as sensor - values are in shared memory
    # @param layer [PAR8] (in) Daisy chain layer number [0..3]
    # @param nos [PAR8] (in) Output bit field [0x00..0x0F]
    # @param tacho [PAR32] (out) Tacho pulses [-MAX .. +MAX]
    def output_get_count(layer, nos, tacho)
      logger.debug do
        args = [layer, nos, tacho]
        "called output_get_count with #{args.inspect}"
      end

      bytes = u8(0xB3)
      bytes += param_simple(layer)
      bytes += param_simple(nos)
      bytes += param_simple(tacho)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Program stop
    def output_prg_stop
      logger.debug do
        args = []
        "called output_prg_stop with #{args.inspect}"
      end

      bytes = u8(0xB4)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Create file or open for append
    Lignite::OPEN_APPEND = 0

    # Create file or open for append
    # @param name [PAR8] (in) First character in file name (character string)
    # @param handle [PAR16] (out) Handle to file
    def file_open_append(name, handle)
      logger.debug do
        args = [name, handle]
        "called file_open_append with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(0)
      bytes += param_simple(name)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Open file for read
    Lignite::OPEN_READ = 1

    # Open file for read
    # @param name [PAR8] (in) First character in file name (character string)
    # @param handle [PAR16] (out) Handle to file
    # @param size [PAR32] (out) File size (0 = not found)
    def file_open_read(name, handle, size)
      logger.debug do
        args = [name, handle, size]
        "called file_open_read with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(1)
      bytes += param_simple(name)
      bytes += param_simple(handle)
      bytes += param_simple(size)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Create file for write
    Lignite::OPEN_WRITE = 2

    # Create file for write
    # @param name [PAR8] (in) First character in file name (character string)
    # @param handle [PAR16] (out) Handle to file
    def file_open_write(name, handle)
      logger.debug do
        args = [name, handle]
        "called file_open_write with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(2)
      bytes += param_simple(name)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Read floating point value from file
    Lignite::READ_VALUE = 3

    # Read floating point value from file
    # @param handle [PAR16] (in) Handle to file
    # @param del [PAR8] (in) Delimiter code
    # @param value [PARF] (out) Value read
    def file_read_value(handle, del, value)
      logger.debug do
        args = [handle, del, value]
        "called file_read_value with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(3)
      bytes += param_simple(handle)
      bytes += param_simple(del)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Write floating point value to file
    Lignite::WRITE_VALUE = 4

    # Write floating point value to file
    # @param handle [PAR16] (in) Handle to file
    # @param del [PAR8] (in) Delimiter code
    # @param value [PARF] (in) Value to write
    # @param figures [PAR8] (in) Total number of figures inclusive decimal point
    # @param decimals [PAR8] (in) Number of decimals
    def file_write_value(handle, del, value, figures, decimals)
      logger.debug do
        args = [handle, del, value, figures, decimals]
        "called file_write_value with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(4)
      bytes += param_simple(handle)
      bytes += param_simple(del)
      bytes += param_simple(value)
      bytes += param_simple(figures)
      bytes += param_simple(decimals)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Read text from file
    Lignite::READ_TEXT = 5

    # Read text from file
    # @param handle [PAR16] (in) Handle to file
    # @param del [PAR8] (in) Delimiter code
    # @param length [PAR16] (in) Maximal string length
    # @param text [PAR8] (out) First character in text to read (character string)
    def file_read_text(handle, del, length, text)
      logger.debug do
        args = [handle, del, length, text]
        "called file_read_text with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(5)
      bytes += param_simple(handle)
      bytes += param_simple(del)
      bytes += param_simple(length)
      bytes += param_simple(text)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Write text to file
    Lignite::WRITE_TEXT = 6

    # Write text to file
    # @param handle [PAR16] (in) Handle to file
    # @param del [PAR8] (in) Delimiter code
    # @param text [PAR8] (in) First character in text to write (character string)
    def file_write_text(handle, del, text)
      logger.debug do
        args = [handle, del, text]
        "called file_write_text with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(6)
      bytes += param_simple(handle)
      bytes += param_simple(del)
      bytes += param_simple(text)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Close file
    Lignite::CLOSE = 7

    # Close file
    # @param handle [PAR16] (in) Handle to file
    def file_close(handle)
      logger.debug do
        args = [handle]
        "called file_close with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(7)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::LOAD_IMAGE = 8

    #
    # @param prgid [PAR16] (in) Program id
    # @param name [PAR8] (in) First character in name (character string)
    # @param size [PAR32] (out) Size
    # @param ip [PAR32] (out) Address of image
    def file_load_image(prgid, name, size, ip)
      logger.debug do
        args = [prgid, name, size, ip]
        "called file_load_image with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(8)
      bytes += param_simple(prgid)
      bytes += param_simple(name)
      bytes += param_simple(size)
      bytes += param_simple(ip)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get handle from filename
    Lignite::GET_HANDLE = 9

    # Get handle from filename
    # @param name [PAR8] (in) First character in file name (character string)
    # @param handle [PAR16] (out) Handle to file
    # @param write [PAR8] (out) Open for write / append (0 = no, 1 = yes)
    def file_get_handle(name, handle, write)
      logger.debug do
        args = [name, handle, write]
        "called file_get_handle with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(9)
      bytes += param_simple(name)
      bytes += param_simple(handle)
      bytes += param_simple(write)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Make folder if not present
    Lignite::MAKE_FOLDER = 10

    # Make folder if not present
    # @param name [PAR8] (in) First character in folder name (character string)
    # @param success [PAR8] (out) Success (0 = no, 1 = yes)
    def file_make_folder(name, success)
      logger.debug do
        args = [name, success]
        "called file_make_folder with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(10)
      bytes += param_simple(name)
      bytes += param_simple(success)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_POOL = 11

    #
    # @param size [PAR32] (in) Size of pool
    # @param handle [PAR16] (out) Handle to file
    # @param ip [PAR32] (out) Address of image
    def file_get_pool(size, handle, ip)
      logger.debug do
        args = [size, handle, ip]
        "called file_get_pool with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(11)
      bytes += param_simple(size)
      bytes += param_simple(handle)
      bytes += param_simple(ip)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SET_LOG_SYNC_TIME = 12

    #
    # @param time [PAR32] (in) Sync time used in data log files
    # @param tick [PAR32] (in) Sync tick used in data log files
    def file_set_log_sync_time(time, tick)
      logger.debug do
        args = [time, tick]
        "called file_set_log_sync_time with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(12)
      bytes += param_simple(time)
      bytes += param_simple(tick)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_FOLDERS = 13

    #
    # @param name [PAR8] (in) First character in folder name (ex "../prjs/")
    # @param items [PAR8] (out) No of sub folders
    def file_get_folders(name, items)
      logger.debug do
        args = [name, items]
        "called file_get_folders with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(13)
      bytes += param_simple(name)
      bytes += param_simple(items)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_LOG_SYNC_TIME = 14

    #
    # @param time [PAR32] (out) Sync time used in data log files
    # @param tick [PAR32] (out) Sync tick used in data log files
    def file_get_log_sync_time(time, tick)
      logger.debug do
        args = [time, tick]
        "called file_get_log_sync_time with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(14)
      bytes += param_simple(time)
      bytes += param_simple(tick)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_SUBFOLDER_NAME = 15

    #
    # @param name [PAR8] (in) First character in folder name (ex "../prjs/")
    # @param item [PAR8] (in) Sub folder index [1..ITEMS]
    # @param length [PAR8] (in) Maximal string length
    # @param string [PAR8] (out) First character in character string
    def file_get_subfolder_name(name, item, length, string)
      logger.debug do
        args = [name, item, length, string]
        "called file_get_subfolder_name with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(15)
      bytes += param_simple(name)
      bytes += param_simple(item)
      bytes += param_simple(length)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Write time slot samples to file
    Lignite::WRITE_LOG = 16

    # Write time slot samples to file
    # @param handle [PAR16] (in) Handle to file
    # @param time [PAR32] (in) Relative time in mS
    # @param items [PAR8] (in) Total number of values in this time slot
    # @param values [PARF] (in) DATAF array (handle) containing values
    def file_write_log(handle, time, items, values)
      logger.debug do
        args = [handle, time, items, values]
        "called file_write_log with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(16)
      bytes += param_simple(handle)
      bytes += param_simple(time)
      bytes += param_simple(items)
      bytes += param_simple(values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Close data log file
    Lignite::CLOSE_LOG = 17

    # Close data log file
    # @param handle [PAR16] (in) Handle to file
    # @param name [PAR8] (in) First character in file name (character string)
    def file_close_log(handle, name)
      logger.debug do
        args = [handle, name]
        "called file_close_log with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(17)
      bytes += param_simple(handle)
      bytes += param_simple(name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_IMAGE = 18

    #
    # @param name [PAR8] (in) First character in name (character string)
    # @param prgid [PAR16] (in) Program id
    # @param item [PAR8] (in) Sub folder index [1..ITEMS]
    # @param ip [PAR32] (out) Address of image
    def file_get_image(name, prgid, item, ip)
      logger.debug do
        args = [name, prgid, item, ip]
        "called file_get_image with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(18)
      bytes += param_simple(name)
      bytes += param_simple(prgid)
      bytes += param_simple(item)
      bytes += param_simple(ip)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_ITEM = 19

    #
    # @param name [PAR8] (in) First character in name (character string)
    # @param string [PAR8] (in) First character in item name string
    # @param item [PAR8] (out) Sub folder index [1..ITEMS]
    def file_get_item(name, string, item)
      logger.debug do
        args = [name, string, item]
        "called file_get_item with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(19)
      bytes += param_simple(name)
      bytes += param_simple(string)
      bytes += param_simple(item)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_CACHE_FILES = 20

    #
    # @param items [PAR8] (out) Number of files in cache
    def file_get_cache_files(items)
      logger.debug do
        args = [items]
        "called file_get_cache_files with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(20)
      bytes += param_simple(items)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::PUT_CACHE_FILE = 21

    #
    # @param string [PAR8] (in) First character in character string
    def file_put_cache_file(string)
      logger.debug do
        args = [string]
        "called file_put_cache_file with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(21)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_CACHE_FILE = 22

    #
    # @param item [PAR8] (in) Cache index [1..ITEMS]
    # @param length [PAR8] (in) Maximal string length
    # @param string [PAR8] (out) First character in character string
    def file_get_cache_file(item, length, string)
      logger.debug do
        args = [item, length, string]
        "called file_get_cache_file with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(22)
      bytes += param_simple(item)
      bytes += param_simple(length)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::DEL_CACHE_FILE = 23

    #
    # @param string [PAR8] (out) First character in character string
    def file_del_cache_file(string)
      logger.debug do
        args = [string]
        "called file_del_cache_file with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(23)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::DEL_SUBFOLDER = 24

    #
    # @param name [PAR8] (in) First character in folder name (ex "../prjs/")
    # @param item [PAR8] (in) Sub folder index [1..ITEMS]
    def file_del_subfolder(name, item)
      logger.debug do
        args = [name, item]
        "called file_del_subfolder with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(24)
      bytes += param_simple(name)
      bytes += param_simple(item)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get the current open log filename
    Lignite::GET_LOG_NAME = 25

    # Get the current open log filename
    # @param length [PAR8] (in) Max string length (don't care if NAME is a HND)
    # @param name [PAR8] (in) First First character in file name (character string or HND)
    def file_get_log_name(length, name)
      logger.debug do
        args = [length, name]
        "called file_get_log_name with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(25)
      bytes += param_simple(length)
      bytes += param_simple(name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Create file for data logging
    Lignite::OPEN_LOG = 27

    # Create file for data logging
    # @param name [PAR8] (in) First character in file name (character string)
    # @param syncedtime [PAR32] (in)
    # @param syncedtick [PAR32] (in)
    # @param nowtick [PAR32] (in)
    # @param sample_interval_in_ms [PAR32] (in)
    # @param duration_in_ms [PAR32] (in)
    # @param sdata [PAR8] (in) First character in sensor type data (character string)
    # @param handle [PAR16] (out) Handle to file
    def file_open_log(name, syncedtime, syncedtick, nowtick, sample_interval_in_ms, duration_in_ms, sdata, handle)
      logger.debug do
        args = [name, syncedtime, syncedtick, nowtick, sample_interval_in_ms, duration_in_ms, sdata, handle]
        "called file_open_log with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(27)
      bytes += param_simple(name)
      bytes += param_simple(syncedtime)
      bytes += param_simple(syncedtick)
      bytes += param_simple(nowtick)
      bytes += param_simple(sample_interval_in_ms)
      bytes += param_simple(duration_in_ms)
      bytes += param_simple(sdata)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Read a number of bytes from file
    Lignite::READ_BYTES = 28

    # Read a number of bytes from file
    # @param handle [PAR16] (in) Handle to file
    # @param bytes [PAR16] (in) Number of bytes to read
    # @param destination [PAR8] (out) First byte in byte stream
    def file_read_bytes(handle, bytes, destination)
      logger.debug do
        args = [handle, bytes, destination]
        "called file_read_bytes with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(28)
      bytes += param_simple(handle)
      bytes += param_simple(bytes)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Write a number of bytes to file
    Lignite::WRITE_BYTES = 29

    # Write a number of bytes to file
    # @param handle [PAR16] (in) Handle to file
    # @param bytes [PAR16] (in) Number of bytes to write
    # @param source [PAR8] (in) First byte in byte stream to write
    def file_write_bytes(handle, bytes, source)
      logger.debug do
        args = [handle, bytes, source]
        "called file_write_bytes with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(29)
      bytes += param_simple(handle)
      bytes += param_simple(bytes)
      bytes += param_simple(source)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Delete file
    Lignite::REMOVE = 30

    # Delete file
    # @param name [PAR8] (in) First character in file name (character string)
    def file_remove(name)
      logger.debug do
        args = [name]
        "called file_remove with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(30)
      bytes += param_simple(name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Move file SOURCE to DEST
    Lignite::MOVE = 31

    # Move file SOURCE to DEST
    # @param source [PAR8] (in) First character in source file name (character string)
    # @param dest [PAR8] (in) First character in destination file name (character string)
    def file_move(source, dest)
      logger.debug do
        args = [source, dest]
        "called file_move with #{args.inspect}"
      end

      bytes = u8(0xC0)
      bytes += param_simple(31)
      bytes += param_simple(source)
      bytes += param_simple(dest)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_FILE = {
      0 => :open_append,
      1 => :open_read,
      2 => :open_write,
      3 => :read_value,
      4 => :write_value,
      5 => :read_text,
      6 => :write_text,
      7 => :close,
      8 => :load_image,
      9 => :get_handle,
      10 => :make_folder,
      11 => :get_pool,
      12 => :set_log_sync_time,
      13 => :get_folders,
      14 => :get_log_sync_time,
      15 => :get_subfolder_name,
      16 => :write_log,
      17 => :close_log,
      18 => :get_image,
      19 => :get_item,
      20 => :get_cache_files,
      21 => :put_cache_file,
      22 => :get_cache_file,
      23 => :del_cache_file,
      24 => :del_subfolder,
      25 => :get_log_name,
      27 => :open_log,
      28 => :read_bytes,
      29 => :write_bytes,
      30 => :remove,
      31 => :move,
    }.freeze

    def file(*args)
      logger.debug "called file with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_FILE.fetch(cvalue)
      __send__("file_#{csym}", *args)
    end

    #
    Lignite::DELETE = 0

    #
    # @param handle [PAR16] (in) Array handle
    def array_delete(handle)
      logger.debug do
        args = [handle]
        "called array_delete with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(0)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::DESTROY = 0

    #
    # @param handle [PAR16] (in) Array handle
    def array_destroy(handle)
      logger.debug do
        args = [handle]
        "called array_destroy with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(0)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::CREATE8 = 1

    #
    # @param elements [PAR32] (in) Number of elements
    # @param handle [PAR16] (out) Array handle
    def array_create8(elements, handle)
      logger.debug do
        args = [elements, handle]
        "called array_create8 with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(1)
      bytes += param_simple(elements)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::CREATE16 = 2

    #
    # @param elements [PAR32] (in) Number of elements
    # @param handle [PAR16] (out) Array handle
    def array_create16(elements, handle)
      logger.debug do
        args = [elements, handle]
        "called array_create16 with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(2)
      bytes += param_simple(elements)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::CREATE32 = 3

    #
    # @param elements [PAR32] (in) Number of elements
    # @param handle [PAR16] (out) Array handle
    def array_create32(elements, handle)
      logger.debug do
        args = [elements, handle]
        "called array_create32 with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(3)
      bytes += param_simple(elements)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::CREATEF = 4

    #
    # @param elements [PAR32] (in) Number of elements
    # @param handle [PAR16] (out) Array handle
    def array_createf(elements, handle)
      logger.debug do
        args = [elements, handle]
        "called array_createf with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(4)
      bytes += param_simple(elements)
      bytes += param_simple(handle)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::RESIZE = 5

    #
    # @param handle [PAR16] (in) Array handle
    # @param elements [PAR32] (in) Total number of elements
    def array_resize(handle, elements)
      logger.debug do
        args = [handle, elements]
        "called array_resize with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(5)
      bytes += param_simple(handle)
      bytes += param_simple(elements)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::FILL = 6

    #
    # @param handle [PAR16] (in) Array handle
    # @param value [PARV] (in) Value to write - type depends on type of array
    def array_fill(handle, value)
      logger.debug do
        args = [handle, value]
        "called array_fill with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(6)
      bytes += param_simple(handle)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::COPY = 7

    #
    # @param hsource [PAR16] (in) Source array Handle
    # @param hdest [PAR16] (out) Destination array handle
    def array_copy(hsource, hdest)
      logger.debug do
        args = [hsource, hdest]
        "called array_copy with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(7)
      bytes += param_simple(hsource)
      bytes += param_simple(hdest)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::INIT8 = 8

    #
    # @param handle [PAR16] (in) Array handle
    # @param index [PAR32] (in) Index to element to write
    # @param elements [PAR32] (in) Number of elements to write
    # @param values [PARVALUES] (in)
    def array_init8(handle, index, elements, *values)
      logger.debug do
        args = [handle, index, elements, *values]
        "called array_init8 with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(8)
      bytes += param_simple(handle)
      bytes += param_simple(index)
      bytes += param_simple(elements)
      bytes += param_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::INIT16 = 9

    #
    # @param handle [PAR16] (in) Array handle
    # @param index [PAR32] (in) Index to element to write
    # @param elements [PAR32] (in) Number of elements to write
    # @param values [PARVALUES] (in)
    def array_init16(handle, index, elements, *values)
      logger.debug do
        args = [handle, index, elements, *values]
        "called array_init16 with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(9)
      bytes += param_simple(handle)
      bytes += param_simple(index)
      bytes += param_simple(elements)
      bytes += param_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::INIT32 = 10

    #
    # @param handle [PAR16] (in) Array handle
    # @param index [PAR32] (in) Index to element to write
    # @param elements [PAR32] (in) Number of elements to write
    # @param values [PARVALUES] (in)
    def array_init32(handle, index, elements, *values)
      logger.debug do
        args = [handle, index, elements, *values]
        "called array_init32 with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(10)
      bytes += param_simple(handle)
      bytes += param_simple(index)
      bytes += param_simple(elements)
      bytes += param_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::INITF = 11

    #
    # @param handle [PAR16] (in) Array handle
    # @param index [PAR32] (in) Index to element to write
    # @param elements [PAR32] (in) Number of elements to write
    # @param values [PARVALUES] (in)
    def array_initf(handle, index, elements, *values)
      logger.debug do
        args = [handle, index, elements, *values]
        "called array_initf with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(11)
      bytes += param_simple(handle)
      bytes += param_simple(index)
      bytes += param_simple(elements)
      bytes += param_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SIZE = 12

    #
    # @param handle [PAR16] (in) Array handle
    # @param elements [PAR32] (out) Total number of elements in array
    def array_size(handle, elements)
      logger.debug do
        args = [handle, elements]
        "called array_size with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(12)
      bytes += param_simple(handle)
      bytes += param_simple(elements)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::SET_SIZE = 12

    #
    # @param handle [PAR16] (in) Array handle
    # @param elements [PAR32] (out) Total number of elements in array
    def array_set_size(handle, elements)
      logger.debug do
        args = [handle, elements]
        "called array_set_size with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(12)
      bytes += param_simple(handle)
      bytes += param_simple(elements)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::READ_CONTENT = 13

    #
    # @param prgid [PAR16] (in) Program slot number (must be running)
    # @param handle [PAR16] (in) Array handle
    # @param index [PAR32] (in) Index to first byte to read
    # @param bytes [PAR32] (in) Number of bytes to read
    # @param array [PAR8] (out) First byte of array to receive data
    def array_read_content(prgid, handle, index, bytes, array)
      logger.debug do
        args = [prgid, handle, index, bytes, array]
        "called array_read_content with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(13)
      bytes += param_simple(prgid)
      bytes += param_simple(handle)
      bytes += param_simple(index)
      bytes += param_simple(bytes)
      bytes += param_simple(array)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::WRITE_CONTENT = 14

    #
    # @param prgid [PAR16] (in) Program slot number (must be running)
    # @param handle [PAR16] (in) Array handle
    # @param index [PAR32] (in) Index to first byte to write
    # @param bytes [PAR32] (in) Number of bytes to write
    # @param array [PAR8] (in) First byte of array to deliver data
    def array_write_content(prgid, handle, index, bytes, array)
      logger.debug do
        args = [prgid, handle, index, bytes, array]
        "called array_write_content with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(14)
      bytes += param_simple(prgid)
      bytes += param_simple(handle)
      bytes += param_simple(index)
      bytes += param_simple(bytes)
      bytes += param_simple(array)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::READ_SIZE = 15

    #
    # @param prgid [PAR16] (in) Program slot number (must be running)
    # @param handle [PAR16] (in) Array handle
    # @param bytes [PAR32] (out) Number of bytes in array
    def array_read_size(prgid, handle, bytes)
      logger.debug do
        args = [prgid, handle, bytes]
        "called array_read_size with #{args.inspect}"
      end

      bytes = u8(0xC1)
      bytes += param_simple(15)
      bytes += param_simple(prgid)
      bytes += param_simple(handle)
      bytes += param_simple(bytes)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_ARRAY = {
      0 => :destroy,
      1 => :create8,
      2 => :create16,
      3 => :create32,
      4 => :createf,
      5 => :resize,
      6 => :fill,
      7 => :copy,
      8 => :init8,
      9 => :init16,
      10 => :init32,
      11 => :initf,
      12 => :set_size,
      13 => :read_content,
      14 => :write_content,
      15 => :read_size,
    }.freeze

    def array(*args)
      logger.debug "called array with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_ARRAY.fetch(cvalue)
      __send__("array_#{csym}", *args)
    end

    # Array element write
    # @param handle [PAR16] (in) Array handle
    # @param index [PAR32] (in) Index to first byte to write
    # @param value [PARV] (in) Value to write - type depends on type of array
    def array_write(handle, index, value)
      logger.debug do
        args = [handle, index, value]
        "called array_write with #{args.inspect}"
      end

      bytes = u8(0xC2)
      bytes += param_simple(handle)
      bytes += param_simple(index)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Array element read
    # @param handle [PAR16] (in) Array handle
    # @param index [PAR32] (in) Index to first byte to write
    # @param value [PARV] (out) Value to read - type depends on type of array
    def array_read(handle, index, value)
      logger.debug do
        args = [handle, index, value]
        "called array_read with #{args.inspect}"
      end

      bytes = u8(0xC3)
      bytes += param_simple(handle)
      bytes += param_simple(index)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Array element append
    # @param handle [PAR16] (in) Array handle
    # @param value [PARV] (in) Value (new element) to append - type depends on type of array
    def array_append(handle, value)
      logger.debug do
        args = [handle, value]
        "called array_append with #{args.inspect}"
      end

      bytes = u8(0xC4)
      bytes += param_simple(handle)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Get memory usage
    # @param total [PAR32] (out) Total memory [KB]
    # @param free [PAR32] (out) Free memory [KB]
    def memory_usage(total, free)
      logger.debug do
        args = [total, free]
        "called memory_usage with #{args.inspect}"
      end

      bytes = u8(0xC5)
      bytes += param_simple(total)
      bytes += param_simple(free)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Test if file exists
    Lignite::EXIST = 16

    # Test if file exists
    # @param name [PAR8] (in) First character in file name (character string)
    # @param flag [PAR8] (out) Exist (0 = no, 1 = yes)
    def filename_exist(name, flag)
      logger.debug do
        args = [name, flag]
        "called filename_exist with #{args.inspect}"
      end

      bytes = u8(0xC6)
      bytes += param_simple(16)
      bytes += param_simple(name)
      bytes += param_simple(flag)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Calculate folder/file size
    Lignite::TOTALSIZE = 17

    # Calculate folder/file size
    # @param name [PAR8] (in) First character in file name (character string)
    # @param files [PAR32] (out) Total number of files
    # @param size [PAR32] (out) Total folder size [KB]
    def filename_totalsize(name, files, size)
      logger.debug do
        args = [name, files, size]
        "called filename_totalsize with #{args.inspect}"
      end

      bytes = u8(0xC6)
      bytes += param_simple(17)
      bytes += param_simple(name)
      bytes += param_simple(files)
      bytes += param_simple(size)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Split filename into Folder, name, extension
    Lignite::SPLIT = 18

    # Split filename into Folder, name, extension
    # @param filename [PAR8] (in) First character in file name (character string)
    # @param length [PAR8] (in) Maximal length for each of the below parameters
    # @param folder [PAR8] (out) First character in folder name (character string)
    # @param name [PAR8] (out) First character in name (character string)
    # @param ext [PAR8] (out) First character in extension (character string)
    def filename_split(filename, length, folder, name, ext)
      logger.debug do
        args = [filename, length, folder, name, ext]
        "called filename_split with #{args.inspect}"
      end

      bytes = u8(0xC6)
      bytes += param_simple(18)
      bytes += param_simple(filename)
      bytes += param_simple(length)
      bytes += param_simple(folder)
      bytes += param_simple(name)
      bytes += param_simple(ext)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Merge Folder, name, extension into filename
    Lignite::MERGE = 19

    # Merge Folder, name, extension into filename
    # @param folder [PAR8] (in) First character in folder name (character string)
    # @param name [PAR8] (in) First character in name (character string)
    # @param ext [PAR8] (in) First character in extension (character string)
    # @param length [PAR8] (in) Maximal length for the below parameter
    # @param filename [PAR8] (out) First character in file name (character string)
    def filename_merge(folder, name, ext, length, filename)
      logger.debug do
        args = [folder, name, ext, length, filename]
        "called filename_merge with #{args.inspect}"
      end

      bytes = u8(0xC6)
      bytes += param_simple(19)
      bytes += param_simple(folder)
      bytes += param_simple(name)
      bytes += param_simple(ext)
      bytes += param_simple(length)
      bytes += param_simple(filename)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Check filename
    Lignite::CHECK = 20

    # Check filename
    # @param filename [PAR8] (in) First character in file name (character string)
    # @param ok [PAR8] (out) Filename ok (0 = FAIL, 1 = OK)
    def filename_check(filename, ok)
      logger.debug do
        args = [filename, ok]
        "called filename_check with #{args.inspect}"
      end

      bytes = u8(0xC6)
      bytes += param_simple(20)
      bytes += param_simple(filename)
      bytes += param_simple(ok)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Pack file or folder into "raf" container
    Lignite::PACK = 21

    # Pack file or folder into "raf" container
    # @param filename [PAR8] (in) First character in file name (character string)
    def filename_pack(filename)
      logger.debug do
        args = [filename]
        "called filename_pack with #{args.inspect}"
      end

      bytes = u8(0xC6)
      bytes += param_simple(21)
      bytes += param_simple(filename)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Unpack "raf" container
    Lignite::UNPACK = 22

    # Unpack "raf" container
    # @param filename [PAR8] (in) First character in file name (character string)
    def filename_unpack(filename)
      logger.debug do
        args = [filename]
        "called filename_unpack with #{args.inspect}"
      end

      bytes = u8(0xC6)
      bytes += param_simple(22)
      bytes += param_simple(filename)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get current folder name
    Lignite::GET_FOLDERNAME = 23

    # Get current folder name
    # @param length [PAR8] (in) Maximal length for the below parameter
    # @param foldername [PAR8] (out) First character in folder name (character string)
    def filename_get_foldername(length, foldername)
      logger.debug do
        args = [length, foldername]
        "called filename_get_foldername with #{args.inspect}"
      end

      bytes = u8(0xC6)
      bytes += param_simple(23)
      bytes += param_simple(length)
      bytes += param_simple(foldername)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_FILENAME = {
      16 => :exist,
      17 => :totalsize,
      18 => :split,
      19 => :merge,
      20 => :check,
      21 => :pack,
      22 => :unpack,
      23 => :get_foldername,
    }.freeze

    def filename(*args)
      logger.debug "called filename with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_FILENAME.fetch(cvalue)
      __send__("filename_#{csym}", *args)
    end

    # Read 8 bit value from SOURCE[INDEX] to DESTINATION
    # @param source [PAR8] (in) First value in array of values
    # @param index [PAR8] (in) Index to array member to read
    # @param destination [PAR8] (out) Variable to receive read value
    def read8(source, index, destination)
      logger.debug do
        args = [source, index, destination]
        "called read8 with #{args.inspect}"
      end

      bytes = u8(0xC8)
      bytes += param_simple(source)
      bytes += param_simple(index)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read 16 bit value from SOURCE[INDEX] to DESTINATION
    # @param source [PAR16] (in) First value in array of values
    # @param index [PAR8] (in) Index to array member to read
    # @param destination [PAR16] (out) Variable to receive read value
    def read16(source, index, destination)
      logger.debug do
        args = [source, index, destination]
        "called read16 with #{args.inspect}"
      end

      bytes = u8(0xC9)
      bytes += param_simple(source)
      bytes += param_simple(index)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read 32 bit value from SOURCE[INDEX] to DESTINATION
    # @param source [PAR32] (in) First value in array of values
    # @param index [PAR8] (in) Index to array member to read
    # @param destination [PAR32] (out) Variable to receive read value
    def read32(source, index, destination)
      logger.debug do
        args = [source, index, destination]
        "called read32 with #{args.inspect}"
      end

      bytes = u8(0xCA)
      bytes += param_simple(source)
      bytes += param_simple(index)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read floating point value from SOURCE[INDEX] to DESTINATION
    # @param source [PARF] (in) First value in array of values
    # @param index [PAR8] (in) Index to array member to read
    # @param destination [PARF] (out) Variable to receive read value
    def readf(source, index, destination)
      logger.debug do
        args = [source, index, destination]
        "called readf with #{args.inspect}"
      end

      bytes = u8(0xCB)
      bytes += param_simple(source)
      bytes += param_simple(index)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Write 8 bit value from SOURCE to DESTINATION[INDEX]
    # @param source [PAR8] (in) Variable to write
    # @param index [PAR8] (in) Index to array member to write
    # @param destination [PAR8] (in) Array to receive write value
    def write8(source, index, destination)
      logger.debug do
        args = [source, index, destination]
        "called write8 with #{args.inspect}"
      end

      bytes = u8(0xCC)
      bytes += param_simple(source)
      bytes += param_simple(index)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Write 16 bit value from SOURCE to DESTINATION[INDEX]
    # @param source [PAR16] (in) Variable to write
    # @param index [PAR8] (in) Index to array member to write
    # @param destination [PAR16] (in) Array to receive write value
    def write16(source, index, destination)
      logger.debug do
        args = [source, index, destination]
        "called write16 with #{args.inspect}"
      end

      bytes = u8(0xCD)
      bytes += param_simple(source)
      bytes += param_simple(index)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Write 32 bit value from SOURCE to DESTINATION[INDEX]
    # @param source [PAR32] (in) Variable to write
    # @param index [PAR8] (in) Index to array member to write
    # @param destination [PAR32] (in) Array to receive write value
    def write32(source, index, destination)
      logger.debug do
        args = [source, index, destination]
        "called write32 with #{args.inspect}"
      end

      bytes = u8(0xCE)
      bytes += param_simple(source)
      bytes += param_simple(index)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Write floating point value from SOURCE to DESTINATION[INDEX]
    # @param source [PARF] (in) Variable to write
    # @param index [PAR8] (in) Index to array member to write
    # @param destination [PARF] (in) Array to receive write value
    def writef(source, index, destination)
      logger.debug do
        args = [source, index, destination]
        "called writef with #{args.inspect}"
      end

      bytes = u8(0xCF)
      bytes += param_simple(source)
      bytes += param_simple(index)
      bytes += param_simple(destination)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Test if communication is busy
    # @param hardware [PAR8] (in) Hardware transport layer
    # @param name [PAR8] (in) Name of the remote/own device
    def com_ready(hardware, name)
      logger.debug do
        args = [hardware, name]
        "called com_ready with #{args.inspect}"
      end

      bytes = u8(0xD0)
      bytes += param_simple(hardware)
      bytes += param_simple(name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # This code does not exist in normal program
    # @param value1 [PAR8] ()
    # @param value2 [PAR8] ()
    # @param value3 [PAR16] ()
    # @param value4 [PAR8] ()
    def com_readdata(value1, value2, value3, value4)
      logger.debug do
        args = [value1, value2, value3, value4]
        "called com_readdata with #{args.inspect}"
      end

      bytes = u8(0xD1)
      bytes += param_simple(value1)
      bytes += param_simple(value2)
      bytes += param_simple(value3)
      bytes += param_simple(value4)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # This code does not exist in normal program
    # @param value1 [PAR8] ()
    # @param value2 [PAR8] ()
    # @param value3 [PAR16] ()
    # @param value4 [PAR8] ()
    def com_writedata(value1, value2, value3, value4)
      logger.debug do
        args = [value1, value2, value3, value4]
        "called com_writedata with #{args.inspect}"
      end

      bytes = u8(0xD2)
      bytes += param_simple(value1)
      bytes += param_simple(value2)
      bytes += param_simple(value3)
      bytes += param_simple(value4)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Get active state
    Lignite::GET_ON_OFF = 1

    # Get active state
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param active [PAR8] (out) Active [0,1]
    def com_get_get_on_off(hardware, active)
      logger.debug do
        args = [hardware, active]
        "called com_get_get_on_off with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(1)
      bytes += param_simple(hardware)
      bytes += param_simple(active)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get visibility state
    Lignite::GET_VISIBLE = 2

    # Get visibility state
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param visible [PAR8] (out) Visible [0,1]
    def com_get_get_visible(hardware, visible)
      logger.debug do
        args = [hardware, visible]
        "called com_get_get_visible with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(2)
      bytes += param_simple(hardware)
      bytes += param_simple(visible)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get status.
    Lignite::GET_RESULT = 4

    # Get status.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param item [PAR8] (in) Name index
    # @param result [PAR8] (out) Results
    def com_get_get_result(hardware, item, result)
      logger.debug do
        args = [hardware, item, result]
        "called com_get_get_result with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(4)
      bytes += param_simple(hardware)
      bytes += param_simple(item)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get pin code.
    Lignite::GET_PIN = 5

    # Get pin code.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param name [PAR8] (in) First character in character string
    # @param length [PAR8] (in) Max length of returned string
    # @param pincode [PAR8] (out) First character in character string
    def com_get_get_pin(hardware, name, length, pincode)
      logger.debug do
        args = [hardware, name, length, pincode]
        "called com_get_get_pin with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(5)
      bytes += param_simple(hardware)
      bytes += param_simple(name)
      bytes += param_simple(length)
      bytes += param_simple(pincode)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Gets a list state value. This can be compared to previous values to determine if items are added or removed from a list since the last call.
    Lignite::LIST_STATE = 7

    # Gets a list state value. This can be compared to previous values to determine if items are added or removed from a list since the last call.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param state [PAR16] (out) Value that represents the current state
    def com_get_list_state(hardware, state)
      logger.debug do
        args = [hardware, state]
        "called com_get_list_state with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(7)
      bytes += param_simple(hardware)
      bytes += param_simple(state)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get number of item from search.
    Lignite::SEARCH_ITEMS = 8

    # Get number of item from search.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param items [PAR8] (out) No of items in seach list
    def com_get_search_items(hardware, items)
      logger.debug do
        args = [hardware, items]
        "called com_get_search_items with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(8)
      bytes += param_simple(hardware)
      bytes += param_simple(items)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get search item informations.
    Lignite::SEARCH_ITEM = 9

    # Get search item informations.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param item [PAR8] (in) Item - index in search list
    # @param length [PAR8] (in) Max length of returned string
    # @param name [PAR8] (out) First character in character string
    # @param paired [PAR8] (out) Paired [0,1]
    # @param connected [PAR8] (out) Connected [0,1]
    # @param type [PAR8] (out) Bluetooth Device Type
    # @param visible [PAR8] (out) Visible [0,1]
    def com_get_search_item(hardware, item, length, name, paired, connected, type, visible)
      logger.debug do
        args = [hardware, item, length, name, paired, connected, type, visible]
        "called com_get_search_item with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(9)
      bytes += param_simple(hardware)
      bytes += param_simple(item)
      bytes += param_simple(length)
      bytes += param_simple(name)
      bytes += param_simple(paired)
      bytes += param_simple(connected)
      bytes += param_simple(type)
      bytes += param_simple(visible)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get no of item in favourite list.
    Lignite::FAVOUR_ITEMS = 10

    # Get no of item in favourite list.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param items [PAR8] (out) No of items in seach list
    def com_get_favour_items(hardware, items)
      logger.debug do
        args = [hardware, items]
        "called com_get_favour_items with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(10)
      bytes += param_simple(hardware)
      bytes += param_simple(items)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get favourite item information.
    Lignite::FAVOUR_ITEM = 11

    # Get favourite item information.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param item [PAR8] (in) Item - index in favourite list
    # @param length [PAR8] (in) Max length of returned string
    # @param name [PAR8] (out) First character in character string
    # @param paired [PAR8] (out) Paired [0,1]
    # @param connected [PAR8] (out) Connected [0,1]
    # @param type [PAR8] (out) Bluetooth Device Type
    def com_get_favour_item(hardware, item, length, name, paired, connected, type)
      logger.debug do
        args = [hardware, item, length, name, paired, connected, type]
        "called com_get_favour_item with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(11)
      bytes += param_simple(hardware)
      bytes += param_simple(item)
      bytes += param_simple(length)
      bytes += param_simple(name)
      bytes += param_simple(paired)
      bytes += param_simple(connected)
      bytes += param_simple(type)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Get bluetooth address information
    Lignite::GET_ID = 12

    # Get bluetooth address information
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param length [PAR8] (in) Max length of returned string
    # @param string [PAR8] (out) First character in BT adr string
    def com_get_get_id(hardware, length, string)
      logger.debug do
        args = [hardware, length, string]
        "called com_get_get_id with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(12)
      bytes += param_simple(hardware)
      bytes += param_simple(length)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Gets the name of the brick
    Lignite::GET_BRICKNAME = 13

    # Gets the name of the brick
    # @param length [PAR8] (in) Max length of returned string
    # @param name [PAR8] (out) First character in brick name
    def com_get_get_brickname(length, name)
      logger.debug do
        args = [length, name]
        "called com_get_get_brickname with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(13)
      bytes += param_simple(length)
      bytes += param_simple(name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Gets the network information. WIFI only
    Lignite::GET_NETWORK = 14

    # Gets the network information. WIFI only
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param length [PAR8] (in) Max length of returned string
    # @param name [PAR8] (out) First character in AP name
    # @param mac [PAR8] (out) First character in MAC address string
    # @param ip [PAR8] (out) First character in IP address string
    def com_get_get_network(hardware, length, name, mac, ip)
      logger.debug do
        args = [hardware, length, name, mac, ip]
        "called com_get_get_network with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(14)
      bytes += param_simple(hardware)
      bytes += param_simple(length)
      bytes += param_simple(name)
      bytes += param_simple(mac)
      bytes += param_simple(ip)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Return if hardare is present. WIFI only
    Lignite::GET_PRESENT = 15

    # Return if hardare is present. WIFI only
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param ok [PAR8] (out) Present [0,1]
    def com_get_get_present(hardware, ok)
      logger.debug do
        args = [hardware, ok]
        "called com_get_get_present with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(15)
      bytes += param_simple(hardware)
      bytes += param_simple(ok)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Returns the encryption mode of the hardware. WIFI only
    Lignite::GET_ENCRYPT = 16

    # Returns the encryption mode of the hardware. WIFI only
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param item [PAR8] (in) Item - index in favourite list
    # @param type [PAR8] (out) Encryption type
    def com_get_get_encrypt(hardware, item, type)
      logger.debug do
        args = [hardware, item, type]
        "called com_get_get_encrypt with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(16)
      bytes += param_simple(hardware)
      bytes += param_simple(item)
      bytes += param_simple(type)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::CONNEC_ITEMS = 17

    #
    # @param hardware [PAR8] ()
    # @param items [PAR8] ()
    def com_get_connec_items(hardware, items)
      logger.debug do
        args = [hardware, items]
        "called com_get_connec_items with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(17)
      bytes += param_simple(hardware)
      bytes += param_simple(items)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::CONNEC_ITEM = 18

    #
    # @param hardware [PAR8] ()
    # @param item [PAR8] ()
    # @param length [PAR8] ()
    # @param name [PAR8] ()
    # @param type [PAR8] ()
    def com_get_connec_item(hardware, item, length, name, type)
      logger.debug do
        args = [hardware, item, length, name, type]
        "called com_get_connec_item with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(18)
      bytes += param_simple(hardware)
      bytes += param_simple(item)
      bytes += param_simple(length)
      bytes += param_simple(name)
      bytes += param_simple(type)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Returns the encryption mode of the hardware. WIFI only
    Lignite::GET_INCOMING = 19

    # Returns the encryption mode of the hardware. WIFI only
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param length [PAR8] (in) Max length of returned string
    # @param name [PAR8] (in) First character in name
    # @param type [PAR8] (out) Encryption type
    def com_get_get_incoming(hardware, length, name, type)
      logger.debug do
        args = [hardware, length, name, type]
        "called com_get_get_incoming with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(19)
      bytes += param_simple(hardware)
      bytes += param_simple(length)
      bytes += param_simple(name)
      bytes += param_simple(type)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    #
    Lignite::GET_MODE2 = 20

    #
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param active [PAR8] (out) Active [0,1], 1 = on, 0 = off
    def com_get_get_mode2(hardware, active)
      logger.debug do
        args = [hardware, active]
        "called com_get_get_mode2 with #{args.inspect}"
      end

      bytes = u8(0xD3)
      bytes += param_simple(20)
      bytes += param_simple(hardware)
      bytes += param_simple(active)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_COM_GET = {
      1 => :get_on_off,
      2 => :get_visible,
      4 => :get_result,
      5 => :get_pin,
      7 => :list_state,
      8 => :search_items,
      9 => :search_item,
      10 => :favour_items,
      11 => :favour_item,
      12 => :get_id,
      13 => :get_brickname,
      14 => :get_network,
      15 => :get_present,
      16 => :get_encrypt,
      17 => :connec_items,
      18 => :connec_item,
      19 => :get_incoming,
      20 => :get_mode2,
    }.freeze

    def com_get(*args)
      logger.debug "called com_get with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_COM_GET.fetch(cvalue)
      __send__("com_get_#{csym}", *args)
    end

    # Set active state, either on or off
    Lignite::SET_ON_OFF = 1

    # Set active state, either on or off
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param active [PAR8] (in) Active [0,1], 1 = on, 0 = off
    def com_set_set_on_off(hardware, active)
      logger.debug do
        args = [hardware, active]
        "called com_set_set_on_off with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(1)
      bytes += param_simple(hardware)
      bytes += param_simple(active)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Set visibility state - Only available for bluetooth
    Lignite::SET_VISIBLE = 2

    # Set visibility state - Only available for bluetooth
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param visible [PAR8] (in) Visible [0,1], 1 = visible, 0 = invisible
    def com_set_set_visible(hardware, visible)
      logger.debug do
        args = [hardware, visible]
        "called com_set_set_visible with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(2)
      bytes += param_simple(hardware)
      bytes += param_simple(visible)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Starts or or stops the search for remote devices
    Lignite::SET_SEARCH = 3

    # Starts or or stops the search for remote devices
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param search [PAR8] (in) Search [0,1] 0 = stop search, 1 = start search
    def com_set_set_search(hardware, search)
      logger.debug do
        args = [hardware, search]
        "called com_set_set_search with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(3)
      bytes += param_simple(hardware)
      bytes += param_simple(search)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Set pin code.
    Lignite::SET_PIN = 5

    # Set pin code.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param name [PAR8] (in) First character in character string
    # @param pincode [PAR8] (in) First character in character string
    def com_set_set_pin(hardware, name, pincode)
      logger.debug do
        args = [hardware, name, pincode]
        "called com_set_set_pin with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(5)
      bytes += param_simple(hardware)
      bytes += param_simple(name)
      bytes += param_simple(pincode)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Set pin code.
    Lignite::SET_PASSKEY = 6

    # Set pin code.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param accept [PAR8] (in) Acceptance [0,1] 0 = reject 1 = accept
    def com_set_set_passkey(hardware, accept)
      logger.debug do
        args = [hardware, accept]
        "called com_set_set_passkey with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(6)
      bytes += param_simple(hardware)
      bytes += param_simple(accept)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Initiate or close the connection request to a remote device by the specified name.
    Lignite::SET_CONNECTION = 7

    # Initiate or close the connection request to a remote device by the specified name.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param name [PAR8] (in) First character in character string
    # @param connection [PAR8] (in) Connect [0,1], 1 = Connect, 0 = Disconnect
    def com_set_set_connection(hardware, name, connection)
      logger.debug do
        args = [hardware, name, connection]
        "called com_set_set_connection with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(7)
      bytes += param_simple(hardware)
      bytes += param_simple(name)
      bytes += param_simple(connection)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Sets the name of the brick
    Lignite::SET_BRICKNAME = 8

    # Sets the name of the brick
    # @param name [PAR8] (in) First character in character string
    def com_set_set_brickname(name)
      logger.debug do
        args = [name]
        "called com_set_set_brickname with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(8)
      bytes += param_simple(name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Moves the index in list one step up.
    Lignite::SET_MOVEUP = 9

    # Moves the index in list one step up.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param item [PAR8] (in) Index in table
    def com_set_set_moveup(hardware, item)
      logger.debug do
        args = [hardware, item]
        "called com_set_set_moveup with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(9)
      bytes += param_simple(hardware)
      bytes += param_simple(item)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Moves the index in list one step down.
    Lignite::SET_MOVEDOWN = 10

    # Moves the index in list one step down.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param item [PAR8] (in) Index in table
    def com_set_set_movedown(hardware, item)
      logger.debug do
        args = [hardware, item]
        "called com_set_set_movedown with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(10)
      bytes += param_simple(hardware)
      bytes += param_simple(item)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Sets the encryption type for an item in a list.
    Lignite::SET_ENCRYPT = 11

    # Sets the encryption type for an item in a list.
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param item [PAR8] (in) Index in table
    # @param encrypt [PAR8] (in) Encryption type
    def com_set_set_encrypt(hardware, item, encrypt)
      logger.debug do
        args = [hardware, item, encrypt]
        "called com_set_set_encrypt with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(11)
      bytes += param_simple(hardware)
      bytes += param_simple(item)
      bytes += param_simple(encrypt)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Sets the SSID name. Only used for WIFI
    Lignite::SET_SSID = 12

    # Sets the SSID name. Only used for WIFI
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param name [PAR8] (in) First character in character string
    def com_set_set_ssid(hardware, name)
      logger.debug do
        args = [hardware, name]
        "called com_set_set_ssid with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(12)
      bytes += param_simple(hardware)
      bytes += param_simple(name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Set active mode state, either active or not
    Lignite::SET_MODE2 = 13

    # Set active mode state, either active or not
    # @param hardware [PAR8] (in) Hardware Transport Layer
    # @param active [PAR8] (in) Active [0,1], 1 = on, 0 = off
    def com_set_set_mode2(hardware, active)
      logger.debug do
        args = [hardware, active]
        "called com_set_set_mode2 with #{args.inspect}"
      end

      bytes = u8(0xD4)
      bytes += param_simple(13)
      bytes += param_simple(hardware)
      bytes += param_simple(active)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_COM_SET = {
      1 => :set_on_off,
      2 => :set_visible,
      3 => :set_search,
      5 => :set_pin,
      6 => :set_passkey,
      7 => :set_connection,
      8 => :set_brickname,
      9 => :set_moveup,
      10 => :set_movedown,
      11 => :set_encrypt,
      12 => :set_ssid,
      13 => :set_mode2,
    }.freeze

    def com_set(*args)
      logger.debug "called com_set with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_COM_SET.fetch(cvalue)
      __send__("com_set_#{csym}", *args)
    end

    # Test if communication is busy
    # @param hardware [PAR8] (in) Hardware transport layer
    # @param name [PAR8] (in) Name of the remote/own device
    # @param busy [PAR8] (out) Busy flag
    def com_test(hardware, name, busy)
      logger.debug do
        args = [hardware, name, busy]
        "called com_test with #{args.inspect}"
      end

      bytes = u8(0xD5)
      bytes += param_simple(hardware)
      bytes += param_simple(name)
      bytes += param_simple(busy)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Removes a know remote device from the brick
    # @param hardware [PAR8] ()
    # @param remote_name [PAR8] () Pointer to remote brick name
    def com_remove(hardware, remote_name)
      logger.debug do
        args = [hardware, remote_name]
        "called com_remove with #{args.inspect}"
      end

      bytes = u8(0xD6)
      bytes += param_simple(hardware)
      bytes += param_simple(remote_name)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Sends a file or folder to remote brick.
    # @param hardware [PAR8] ()
    # @param remote_name [PAR8] () Pointer to remote brick name
    # @param file_name [PAR8] () File/folder name to send
    # @param file_type [PAR8] () File or folder type to send
    def com_writefile(hardware, remote_name, file_name, file_type)
      logger.debug do
        args = [hardware, remote_name, file_name, file_type]
        "called com_writefile with #{args.inspect}"
      end

      bytes = u8(0xD7)
      bytes += param_simple(hardware)
      bytes += param_simple(remote_name)
      bytes += param_simple(file_name)
      bytes += param_simple(file_type)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Open a mail box on the brick
    # @param no [PAR8] (in) Reference ID for the mailbox. Maximum number of mailboxes is 30
    # @param boxname [PAR8] (in) Zero terminated string with the mailbox name
    # @param types [PAR8] (in) Data type of the content of the mailbox
    # @param fifosize [PAR8] (in) Not used
    # @param values [PAR8] (in) Number of values of the type (specified by TYPE).
    def mailbox_open(no, boxname, types, fifosize, values)
      logger.debug do
        args = [no, boxname, types, fifosize, values]
        "called mailbox_open with #{args.inspect}"
      end

      bytes = u8(0xD8)
      bytes += param_simple(no)
      bytes += param_simple(boxname)
      bytes += param_simple(types)
      bytes += param_simple(fifosize)
      bytes += param_simple(values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Write to mailbox in remote brick
    # @param brickname [PAR8] (in) Zero terminated string name of the receiving brick
    # @param hardware [PAR8] (in) Transportation media
    # @param boxname [PAR8] (in) Zero terminated string name of the receiving mailbox
    # @param type [PAR8] (in) Data type of the values
    # @param values [PARNO] (in) Number of values of the specified type to send
    def mailbox_write(brickname, hardware, boxname, type, *values)
      logger.debug do
        args = [brickname, hardware, boxname, type, *values]
        "called mailbox_write with #{args.inspect}"
      end

      bytes = u8(0xD9)
      bytes += param_simple(brickname)
      bytes += param_simple(hardware)
      bytes += param_simple(boxname)
      bytes += param_simple(type)
      bytes += param_n_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read data from mailbox specified by NO
    # @param no [PAR8] (in) Messagebox ID of the message box you want to read
    # @param length [PAR8] (in) Maximum bytes to be read
    # @param values [PARNO] (in) Number of value to read
    def mailbox_read(no, length, *values)
      logger.debug do
        args = [no, length, *values]
        "called mailbox_read with #{args.inspect}"
      end

      bytes = u8(0xDA)
      bytes += param_simple(no)
      bytes += param_simple(length)
      bytes += param_n_multiple(*values)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Tests if new message has been read
    # @param no [PAR8] (in) Reference ID mailbox number
    # @param busy [PAR8] (out) If Busy = TRUE then no new messages are received
    def mailbox_test(no, busy)
      logger.debug do
        args = [no, busy]
        "called mailbox_test with #{args.inspect}"
      end

      bytes = u8(0xDB)
      bytes += param_simple(no)
      bytes += param_simple(busy)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Waiting from message to be read
    # @param no [PAR8] (in) Reference ID mailbox number
    def mailbox_ready(no)
      logger.debug do
        args = [no]
        "called mailbox_ready with #{args.inspect}"
      end

      bytes = u8(0xDC)
      bytes += param_simple(no)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Closes mailbox indicated by NO
    # @param no [PAR8] (in) Reference ID mailbox number
    def mailbox_close(no)
      logger.debug do
        args = [no]
        "called mailbox_close with #{args.inspect}"
      end

      bytes = u8(0xDD)
      bytes += param_simple(no)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Set the connection type for a specific port
    # @param layer [PAR8] (in) Chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param conn [PAR8] (in) Connection type (CONN_NXT_IIC, CONN_NXT_DUMB or CONN_INPUT_DUMB)
    def input_set_conn(layer, no, conn)
      logger.debug do
        args = [layer, no, conn]
        "called input_set_conn with #{args.inspect}"
      end

      bytes = u8(0xE0)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(conn)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read I2C data from specified port
    # @param layer [PAR8] (in) Chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param rdlng [PAR8] (in) No of bytes to read
    # @param rddata [PAR8] (out) DATA8 array (handle) to read into
    # @param result [PAR8] (out) Write/read result (OK, FAIL, BUSY, STOP)
    def input_iic_read(layer, no, rdlng, rddata, result)
      logger.debug do
        args = [layer, no, rdlng, rddata, result]
        "called input_iic_read with #{args.inspect}"
      end

      bytes = u8(0xE1)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(rdlng)
      bytes += param_simple(rddata)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Read I2C status of specified port
    # @param layer [PAR8] (in) Chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param result [PAR8] (out) Current I2C bus status (OK, FAIL, BUSY, STOP)
    def input_iic_status(layer, no, result)
      logger.debug do
        args = [layer, no, result]
        "called input_iic_status with #{args.inspect}"
      end

      bytes = u8(0xE2)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Write I2C data to specified port
    # @param layer [PAR8] (in) Chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param wrlng [PAR8] (in) No of bytes to write
    # @param wrdata [PAR8] (in) DATA8 array (handle) of data to write
    # @param rdlng [PAR8] (in) No of bytes to read
    # @param result [PAR8] (out) Write/read result (OK, FAIL, BUSY, STOP)
    def input_iic_write(layer, no, wrlng, wrdata, rdlng, result)
      logger.debug do
        args = [layer, no, wrlng, wrdata, rdlng, result]
        "called input_iic_write with #{args.inspect}"
      end

      bytes = u8(0xE3)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(wrlng)
      bytes += param_simple(wrdata)
      bytes += param_simple(rdlng)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Enabled or disable auto-id for a specific sensor port
    # @param layer [PAR8] (in) Chain layer number [0..3]
    # @param no [PAR8] (in) Port number
    # @param enable [PAR8] (in) Boolean (0 disabled, 1 enable)
    def input_set_autoid(layer, no, enable)
      logger.debug do
        args = [layer, no, enable]
        "called input_set_autoid with #{args.inspect}"
      end

      bytes = u8(0xE4)
      bytes += param_simple(layer)
      bytes += param_simple(no)
      bytes += param_simple(enable)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Returns the size of the mailbox.
    # @param no [PAR8] (in) Reference ID mailbox number
    # @param size [PAR8] (out) Size in bytes of the contents of mailbox NO
    def mailbox_size(no, size)
      logger.debug do
        args = [no, size]
        "called mailbox_size with #{args.inspect}"
      end

      bytes = u8(0xE5)
      bytes += param_simple(no)
      bytes += param_simple(size)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Get md5 sum of a file
    # @param name [PAR8] (in) First character in file name (character string)
    # @param md5sum [PAR8] (out) First byte in md5 sum (byte array)
    # @param success [PAR8] (out) Success flag (0 = no, 1 = yes)
    def file_md5sum(name, md5sum, success)
      logger.debug do
        args = [name, md5sum, success]
        "called file_md5sum with #{args.inspect}"
      end

      bytes = u8(0xE6)
      bytes += param_simple(name)
      bytes += param_simple(md5sum)
      bytes += param_simple(success)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Load the selected VM
    # @param vmindex [PAR8] (in) VM Index, Robotc = 0, Labview = 1
    # @param result [PAR8] (out) OK if VM loaded ok FAIL if it did not.
    def dynload_vmload(vmindex, result)
      logger.debug do
        args = [vmindex, result]
        "called dynload_vmload with #{args.inspect}"
      end

      bytes = u8(0xF0)
      bytes += param_simple(vmindex)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Clean up the dynamic VM loading system
    def dynload_vmexit
      logger.debug do
        args = []
        "called dynload_vmexit with #{args.inspect}"
      end

      bytes = u8(0xF1)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 0 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_0(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_0 with #{args.inspect}"
      end

      bytes = u8(0xF2)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 1 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_1(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_1 with #{args.inspect}"
      end

      bytes = u8(0xF3)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 2 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_2(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_2 with #{args.inspect}"
      end

      bytes = u8(0xF4)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 3 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_3(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_3 with #{args.inspect}"
      end

      bytes = u8(0xF5)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 4 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_4(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_4 with #{args.inspect}"
      end

      bytes = u8(0xF6)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 5 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_5(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_5 with #{args.inspect}"
      end

      bytes = u8(0xF7)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 6 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_6(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_6 with #{args.inspect}"
      end

      bytes = u8(0xF8)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 7 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_7(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_7 with #{args.inspect}"
      end

      bytes = u8(0xF9)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 8 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_8(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_8 with #{args.inspect}"
      end

      bytes = u8(0xFA)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Execute Entry Point function 9 in Third Party VM
    # @param cmd [PAR8] (in) Sub command to be executed
    # @param length_in [PAR8] (in) Amount of data passed to this opcode
    # @param length_out [PAR16] (out) Amount of data returned
    # @param value [PARV] (out) Data from opcode
    def dynload_entry_9(cmd, length_in, length_out, value)
      logger.debug do
        args = [cmd, length_in, length_out, value]
        "called dynload_entry_9 with #{args.inspect}"
      end

      bytes = u8(0xFB)
      bytes += param_simple(cmd)
      bytes += param_simple(length_in)
      bytes += param_simple(length_out)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Get the index of the currently loaded VM
    # @param result [PAR8] (out) VM Index, Robotc = 0, Labview = 1, -1 for no loaded VM
    def dynload_get_vm(result)
      logger.debug do
        args = [result]
        "called dynload_get_vm with #{args.inspect}"
      end

      bytes = u8(0xFC)
      bytes += param_simple(result)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    # Enables test byte codes for 10 seconds
    Lignite::TST_OPEN = 10

    # Enables test byte codes for 10 seconds
    def tst_tst_open
      logger.debug do
        args = []
        "called tst_tst_open with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(10)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Disables test byte codes
    Lignite::TST_CLOSE = 11

    # Disables test byte codes
    def tst_tst_close
      logger.debug do
        args = []
        "called tst_tst_close with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(11)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Read connector pin status
    Lignite::TST_READ_PINS = 12

    # Read connector pin status
    # @param port [PAR8] (in) Input connector [0..3], output connector [16..19]
    # @param length [PAR8] (in) Number of pins in returned string
    # @param string [PAR8] (out) String variable start index ('0' = low, '1' = high)
    def tst_tst_read_pins(port, length, string)
      logger.debug do
        args = [port, length, string]
        "called tst_tst_read_pins with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(12)
      bytes += param_simple(port)
      bytes += param_simple(length)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Write to connector pin
    Lignite::TST_WRITE_PINS = 13

    # Write to connector pin
    # @param port [PAR8] (in) Input connector [0..3], output connector [16..19]
    # @param length [PAR8] (in) Number of pins in returned string
    # @param string [PAR8] (in) String variable start index ('0' = set low, '1' = set high, 'X' = tristate, '-' = don't touch)

    def tst_tst_write_pins(port, length, string)
      logger.debug do
        args = [port, length, string]
        "called tst_tst_write_pins with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(13)
      bytes += param_simple(port)
      bytes += param_simple(length)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Read raw count from ADC
    Lignite::TST_READ_ADC = 14

    # Read raw count from ADC
    # @param index [PAR8] (in) Input mapped index (see remarks) [0..15]
    # @param value [PAR16] (out) Raw count [0..4095]
    def tst_tst_read_adc(index, value)
      logger.debug do
        args = [index, value]
        "called tst_tst_read_adc with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(14)
      bytes += param_simple(index)
      bytes += param_simple(value)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Write data to port through UART
    Lignite::TST_WRITE_UART = 15

    # Write data to port through UART
    # @param port [PAR8] (in) Input connector [0..3]
    # @param length [PAR8] (in) Length of string to write [0..63]
    # @param string [PAR8] (in) String of data
    def tst_tst_write_uart(port, length, string)
      logger.debug do
        args = [port, length, string]
        "called tst_tst_write_uart with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(15)
      bytes += param_simple(port)
      bytes += param_simple(length)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Read data from port through UART
    Lignite::TST_READ_UART = 16

    # Read data from port through UART
    # @param port [PAR8] (in) Input connector [0..3]
    # @param length [PAR8] (in) Length of string to write [0..63]
    # @param string [PAR8] (out) String of data
    def tst_tst_read_uart(port, length, string)
      logger.debug do
        args = [port, length, string]
        "called tst_tst_read_uart with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(16)
      bytes += param_simple(port)
      bytes += param_simple(length)
      bytes += param_simple(string)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Enable all UARTs
    Lignite::TST_ENABLE_UART = 17

    # Enable all UARTs
    # @param bitrate [PAR32] (in) Bit rate [2400..115200 b/S]
    def tst_tst_enable_uart(bitrate)
      logger.debug do
        args = [bitrate]
        "called tst_tst_enable_uart with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(17)
      bytes += param_simple(bitrate)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Disable all UARTs
    Lignite::TST_DISABLE_UART = 18

    # Disable all UARTs
    def tst_tst_disable_uart
      logger.debug do
        args = []
        "called tst_tst_disable_uart with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(18)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Read accu switch state
    Lignite::TST_ACCU_SWITCH = 19

    # Read accu switch state
    # @param active [PAR8] (out) State [0..1]
    def tst_tst_accu_switch(active)
      logger.debug do
        args = [active]
        "called tst_tst_accu_switch with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(19)
      bytes += param_simple(active)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Turn on mode2
    Lignite::TST_BOOT_MODE2 = 20

    # Turn on mode2
    def tst_tst_boot_mode2
      logger.debug do
        args = []
        "called tst_tst_boot_mode2 with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(20)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Read mode2 status
    Lignite::TST_POLL_MODE2 = 21

    # Read mode2 status
    # @param status [PAR8] (out) State [0..2]
    def tst_tst_poll_mode2(status)
      logger.debug do
        args = [status]
        "called tst_tst_poll_mode2 with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(21)
      bytes += param_simple(status)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Closes mode2
    Lignite::TST_CLOSE_MODE2 = 22

    # Closes mode2
    def tst_tst_close_mode2
      logger.debug do
        args = []
        "called tst_tst_close_mode2 with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(22)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end
    # Read RAM test status status
    Lignite::TST_RAM_CHECK = 23

    # Read RAM test status status
    # @param status [PAR8] (out) State [0,1] 0 = FAIL, 1 = SUCCESS
    def tst_tst_ram_check(status)
      logger.debug do
        args = [status]
        "called tst_tst_ram_check with #{args.inspect}"
      end

      bytes = u8(0xFF)
      bytes += param_simple(23)
      bytes += param_simple(status)
      logger.debug "returning bytecode: #{bytes.inspect}"
      bytes
    end

    MULTIPLEX_TST = {
      10 => :tst_open,
      11 => :tst_close,
      12 => :tst_read_pins,
      13 => :tst_write_pins,
      14 => :tst_read_adc,
      15 => :tst_write_uart,
      16 => :tst_read_uart,
      17 => :tst_enable_uart,
      18 => :tst_disable_uart,
      19 => :tst_accu_switch,
      20 => :tst_boot_mode2,
      21 => :tst_poll_mode2,
      22 => :tst_close_mode2,
      23 => :tst_ram_check,
    }.freeze

    def tst(*args)
      logger.debug "called tst with #{args.inspect}"
      cvalue = args.shift
      csym = MULTIPLEX_TST.fetch(cvalue)
      __send__("tst_#{csym}", *args)
    end
  end
end
