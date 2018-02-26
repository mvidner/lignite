#!/usr/bin/ruby
require "lignite"

dc = Lignite::DirectCommands.new

dc.ui_draw_clean
dc.ui_draw_text(Lignite::FG_COLOR, 20, 40, "Hello, world!")
dc.ui_draw_update

dc.close
