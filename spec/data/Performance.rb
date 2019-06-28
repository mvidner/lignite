# typed: false
appv = "Performance V1.02"

TIMES = 100_000
MS = 1

data32 :Ref

data32 :Counter
data32 :Start
data32 :Stop
data32 :Time
dataf  :DataF
data32 :Data32
data32 :Data32_1
data32 :Data32_2
data32 :Data32_3
data32 :Data32_4
data16 :hData8
data8  :Data8
array8 :DataS, 10
array8 :Text, 36

vmthread :MAIN do
  data8 :ShowVersion

  ui_button_pressed(RIGHT_BUTTON, :ShowVersion)

  self.if :ShowVersion do
    ui_draw_fillrect(BG_COLOR, 4, 50, 170, 28)
    ui_draw_rect(FG_COLOR, 6, 52, 166, 24)
    ui_draw_text(FG_COLOR, 13, 60, appv)
    ui_draw_update

    loop_while_postcond(:ShowVersion) do
      ui_button_pressed(RIGHT_BUTTON, :ShowVersion)
    end

    ui_button_flush
  end

  ui_draw_restore(0)
  ui_draw_topline(0)
  ui_write_led(LED_GREEN)

  move32_f(TIMES, :DataF)
  ui_draw_fillwindow(BG_COLOR, 0, 0)

  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "-----------------------------------")
  ui_draw(UPDATE)

  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "Performance Test (avr.")
  ui_draw(VALUE, FG_COLOR, 110, 120, :DataF, 7, 0)
  ui_draw(TEXT, FG_COLOR, 145, 120, "instr)")
  ui_draw(UPDATE)

  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "-----------------------------------")
  ui_draw(UPDATE)

  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "Byte Code                      [uS]")
  ui_draw(UPDATE)

  ui_draw(SCROLL, 8)

  ui_write(PUT_STRING, "\r\n    ---------------------------------------------")
  ui_write(PUT_STRING, "\r\n    Performance test (average over ")
  ui_write(VALUE32, TIMES)
  ui_write(PUT_STRING, " inst.)")
  ui_write(PUT_STRING, "\r\n    ---------------------------------------------")
  ui_write(PUT_STRING, "\r\n    Byte code                        Time [uS]\r\n\n")
  ui_flush

  call(:Test_REF)
  call(:Test_CALL)

  call(:Test_CALL_4x32)
  call(:Test_MOVEF_32)
  call(:Test_MOVE32_F)
  call(:Test_MOVEF_F)
  call(:Test_ADD32)
  call(:Test_ADDF)
  call(:Test_INPUT_READ)
  # call(:Test_INPUT_DEVICE_READY_PCT)
  call(:Test_ARRAY_READ)
  call(:Test_READ8)
  call(:Test_UI_BUTTON_SHORTPRESS)
  call(:Test_JR)
  call(:Test_NOP)

  # call(:Test_UI_DRAW_CLEAN)
  # call(:Test_UI_DRAW_TEXT_10_aligned)
  # call(:Test_UI_DRAW_TEXT_10_not_aligned)
  # call(:Test_UI_DRAW_ICON)
  # call(:Test_UI_DRAW_BMPFILE)
  # call(:Test_UI_DRAW_RECT)
  # call(:Test_UI_DRAW_PIXEL)
  # call(:Test_UI_DRAW_UPDATE)
  call(:Test_SLEEP)

  ui_write(PUT_STRING, "\r\n    ---------------------------------------------\r\n")
  ui_flush

  self.loop do
    # endless
  end
end

sub :Test_REF do
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Ref)
end

sub :Test_CALL do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "CALL() . . . . . . . . . . .       ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    CALL().......................... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    call(:CallNoPar)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_CALL_4x32 do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "CALL(4xDATA32...) . . . . .        ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    CALL(4xDATA32...)............... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    call(:Call4Par, :Data32_1, :Data32_2, :Data32_3, :Data32_4)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_MOVEF_32 do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "MOVEF_32 . . . . . . . . . .       ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    MOVEF_32........................ ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    movef_32(:DataF, :Data32)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_MOVE32_F do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "MOVE32_F. . . . . . . . . .        ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    MOVE32_F........................ ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    move32_f(:Data32, :DataF)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_MOVEF_F do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "MOVEF_F. . . . . . . . . . .       ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    MOVEF_F......................... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    movef_f(:DataF, :DataF)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ADD32 do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "ADD32 . . . . . . . . . . .        ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    ADD32........................... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    add32(1, :Data32, :Data32)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ADDF do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "ADDF . . . . . . . . . . . .       ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    ADDF............................ ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    addf(1.0, :DataF, :DataF)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_INPUT_READ do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "INPUT_READ. . . . . . . . .        ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    INPUT_READ...................... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    input_read(0, 0, 0, -1, :Data8)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_INPUT_DEVICE_READY_PCT do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "INPUT_DEVICE(READY_PCT...) .       ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    INPUT_DEVICE(READY_PCT...)...... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    input_device(READY_PCT, 0, 0, 0, -1, :Data8)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ARRAY_READ do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "ARRAY_READ(...) . . . . . .        ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    ARRAY_READ(...)................. ")
  ui_flush
  array(CREATE8, 10, :hData8)
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    array_read(:hData8, 5, :Data8)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_READ8 do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "READ8(...) . . . . . . . . .       ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    READ8(...)...................... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    read8(:DataS, 5, :Data8)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_UI_BUTTON_SHORTPRESS do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "UI_BUTTON(SHORTPRESS...). .        ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    UI_BUTTON(SHORTPRESS...)........ ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    ui_button(SHORTPRESS, ENTER_BUTTON, :Data8)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_JR do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "JR(...). . . . . . . . . . .       ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    JR(...)......................... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    jr(0)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_NOP do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "NOP . . . . . . . . . . . .        ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    NOP ............................ ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    nop
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_SLEEP do
  ui_draw(SCROLL, 8)
  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(TEXT, FG_COLOR, 0, 120, "SLEEP() . . . . . . . . . .        ")
  ui_draw(UPDATE)

  ui_write(PUT_STRING, "    SLEEP()......................... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    self.sleep
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ui_draw_CLEAN do
  ui_write(PUT_STRING, "    UI_DRAW(FILLWINDOW,0,0,0)....... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    ui_draw(FILLWINDOW, 0, 0, 0)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ui_draw_TEXT_10_aligned do
  ui_write(PUT_STRING, "    UI_DRAW(TEXT,1,0,0,\"0123456789\") ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    ui_draw(TEXT, FG_COLOR, 0, 0, "0123456789")
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ui_draw_TEXT_10_not_aligned do
  ui_write(PUT_STRING, "    UI_DRAW(TEXT,1,3,0,\"0123456789\") ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    ui_draw(TEXT, FG_COLOR, 3, 16, "0123456789")
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ui_draw_ICON do
  ui_write(PUT_STRING, "    UI_DRAW(ICON...)................ ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    ui_draw(ICON, FG_COLOR, 0, 28, LARGE_ICON, WARNSIGN)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ui_draw_BMPFILE do
  ui_write(PUT_STRING, "    UI_DRAW(BMPFILE...)............. ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    ui_draw(BMPFILE, FG_COLOR, 16, 50, "144x65_POP3")
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ui_draw_RECT do
  ui_write(PUT_STRING, "    UI_DRAW(RECT...)................ ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    ui_draw(RECT, FG_COLOR, 15, 49, 146, 67)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ui_draw_PIXEL do
  ui_write(PUT_STRING, "    UI_DRAW(PIXEL...)............... ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    ui_draw(PIXEL, FG_COLOR, 0, 120)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :Test_ui_draw_UPDATE do
  ui_write(PUT_STRING, "    UI_DRAW(UPDATE)................. ")
  ui_flush
  move32_32(0, :Counter)
  timer_read_us(:Start)

  loop_while lambda {
    # TEST ***********************************************
    ui_draw(UPDATE)
    # ****************************************************
    add32(1, :Counter, :Counter)
  }, Lt32.new(:Counter, TIMES)

  timer_read_us(:Stop)
  sub32(:Stop, :Start, :Time)
  sub32(:Time, :Ref, :Time)

  call(:ShowResult, :Time)
end

sub :ShowResult do
  in32  :Timer

  dataf :Tmp1
  dataf :Tmp2

  move32_f(:Timer, :Tmp1)
  move32_f(MS, :Tmp2)
  mulf(:Tmp1, :Tmp2, :Tmp1)
  move32_f(TIMES, :Tmp2)
  divf(:Tmp1, :Tmp2, :Tmp1)
  ui_write(FLOATVALUE, :Tmp1, 6, 0)
  ui_write(PUT_STRING, "\r\n")
  ui_flush

  ui_draw(SELECT_FONT, TINY_FONT)
  ui_draw(VALUE, FG_COLOR, 145, 120, :Tmp1, 6, 0)
  ui_draw(UPDATE)
end

sub :CallNoPar do
end

sub :Call4Par do
  in32   :Data32_1
  in32   :Data32_2
  out32  :Data32_3
  out32  :Data32_4
end
