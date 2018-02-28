vmthread :MAIN do
  ui_draw_fillwindow(0x00, 0, 0)
  ui_draw_text(1, 10, 50, "Hello, world!")
  ui_draw_update
  ui_button_wait_for_press
end
