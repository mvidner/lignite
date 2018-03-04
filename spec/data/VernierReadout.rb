PORT = 1

vmthread :MAIN do
  data32 :Timer
  data32 :Data1
  datas :String, 8

  loop do
    ui_draw(FILLWINDOW, 0x00, 0, 0)
    ui_draw(SELECT_FONT, SMALL_FONT)
    ui_draw(TEXT, FG_COLOR, 0, 10, "Vernier Readout  V0.00")

    ui_draw(TEXT, FG_COLOR, 0, 50, "Raw 1")
    ui_draw(SELECT_FONT, NORMAL_FONT)

    input_device(READY_RAW, 0, PORT, 1, 0, :Data1)

    and32(:Data1, 0xFFFF, :Data1)
    strings(NUMBER_FORMATTED, :Data1, "%-5d", 8, :String)
    ui_draw(TEXT, FG_COLOR, 64, 50, :String)

    ui_draw(UPDATE)

    timer_wait(250, :Timer)
    timer_ready(:Timer)
  end
end
