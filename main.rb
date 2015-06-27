#!/usr/bin/env ruby
load 'init.rb'
DinnerSchedule.new(Dinner.week(3)).render_file 'DinnerSchedule.pdf'
