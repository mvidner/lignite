PORT = 1

# global vars - unused?!
data16 :cmd
data8  :type
data8  :mode
array8 :data, 6

vmthread :MAIN do
  data32 :Timer
  data32 :Data1
  data32 :Data2
  data32 :Data3
  datas :String, 8
  data8 :Mode
  data8 :State

  move8_8(3, :Mode)

  loop do
    ui_draw(FILLWINDOW, 0x00, 0, 0)
    ui_draw(SELECT_FONT, SMALL_FONT)
    ui_draw(TEXT, FG_COLOR, 0, 10, " Color Readout  V0.00 ")
    ui_draw(TEXT, FG_COLOR, 0, 30, "Mode ")

    ui_draw(TEXT, FG_COLOR, 0, 50, "Raw 1")
    ui_draw(TEXT, FG_COLOR, 0, 65, "Raw 2")
    ui_draw(TEXT, FG_COLOR, 0, 80, "Raw 3")
    ui_draw(TEXT, FG_COLOR, 0, 118, "Left = 3     Right = 4")
    ui_draw(SELECT_FONT, NORMAL_FONT)

    move8_32(:Mode, :Data1)
    and32(:Data1, 0xFF, :Data1)
    strings(NUMBER_FORMATTED, :Data1, "%1d", 8, :String)
    ui_draw(TEXT, FG_COLOR, 64, 30, :String)

    input_device(READY_RAW, 0, PORT, 0, :Mode, :Data1, :Data2, :Data3)

    and32(:Data1, 0xFFFF, :Data1)
    strings(NUMBER_FORMATTED, :Data1, "%-5d", 8, :String)
    ui_draw(TEXT, FG_COLOR, 64, 50, :String)

    and32(:Data2, 0xFFFF, :Data2)
    strings(NUMBER_FORMATTED, :Data2, "%-5d", 8, :String)
    ui_draw(TEXT, FG_COLOR, 64, 65, :String)

    and32(:Data3, 0xFFFF, :Data3)
    strings(NUMBER_FORMATTED, :Data3, "%-5d", 8, :String)
    ui_draw(TEXT, FG_COLOR, 64, 80, :String)

    ui_draw(UPDATE)

    ui_button(SHORTPRESS, LEFT_BUTTON, :State)
    self.if(:State) do
      move8_8(3, :Mode)
    end

    ui_button(SHORTPRESS, RIGHT_BUTTON, :State)
    self.if(:State) do
      move8_8(4, :Mode)
    end

    timer_wait(250, :Timer)
    timer_ready(:Timer)
  end
end
