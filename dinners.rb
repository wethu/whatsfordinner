#!/usr/bin/env ruby
load 'init.rb'

PROTEIN_FREQ = {
  :chicken => 3,
  :pork => 2,
  :beef => 2,
  :fish => 3
}

data = YAML::load_file('db/store.yml')

dinners = DinnerList.new
data.each do |dinner|
  dinners.push(Dinner.new(dinner))
end

puts "Found: #{dinners.find("steak")}"
