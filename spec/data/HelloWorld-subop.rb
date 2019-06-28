# typed: false
vmthread :MAIN do
  ui_draw(FILLWINDOW, 0x00, 0, 0)
  ui_draw(TEXT, FG_COLOR, 10, 50, "Hello, world!")
  ui_draw(UPDATE)
  ui_button(WAIT_FOR_PRESS)
end
