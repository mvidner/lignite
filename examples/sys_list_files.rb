#!/usr/bin/ruby
require "lignite"

sc = Lignite::SystemCommands.new

result = ""
name = "/home/root/lms2012/prjs/BrkProg_SAVE/"
bufsize = 20 # to demonstrate chunking
fsize, handle, data = sc.list_files(bufsize, name)
loop do
  result += data
  fsize -= data.bytesize
  break if fsize.zero?
  handle, data = sc.continue_list_files(handle, bufsize)
end
puts result

sc.close
