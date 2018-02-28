appv = "NoDebug V1.02"

vmthread :MAIN do
  data8 :ShowVersion

  ui_button(PRESSED, RIGHT_BUTTON, :ShowVersion)
  self.if :ShowVersion do
    ui_draw(FILLRECT, BG_COLOR, 4, 50, 170, 28)
    ui_draw(RECT, FG_COLOR, 6, 52, 166, 24)
    ui_draw(TEXT, FG_COLOR, 13, 60, appv)
    ui_draw(UPDATE)

    loop_while_postcond(:ShowVersion) do
      ui_button(PRESSED, RIGHT_BUTTON, :ShowVersion)
    end

    ui_button(FLUSH)
  end

  ui_draw(RESTORE, 0)
  ui_draw(TOPLINE, 1)
  ui_write(LED, LED_GREEN)

  ui_write(TERMINAL, 0)
end
