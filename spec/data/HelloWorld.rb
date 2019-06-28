# typed: false
vmthread :MAIN do
  ui_draw_fillwindow(BG_COLOR, 0, 0)
  ui_draw_text(FG_COLOR, 10, 50, "Hello, world!")
  ui_draw_update
  ui_button_wait_for_press
end
