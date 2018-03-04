vmthread :main do
  data8 :var1
  data8 :var2

  move8_8(1, :var1)
  call(:foo, :var1, :var2)
  ui_write_value8(:var2)
  ui_write_put_string("\r\n")
  ui_flush
end

sub :foo do
  in8 :par1
  out8 :par2

  ui_write_value8(:par1)
  ui_write_put_string("\r\n")
  ui_flush
  move8_8(:par1, :par2)
end
