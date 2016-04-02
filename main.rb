#!/usr/bin/env ruby
load "init.rb"

def draw_table(data)
  table = TTY::Table.new(
    header: Date::DAYNAMES,
    rows: data.map { |r| r.map(&:name).to_a }.to_a
  )
  puts table.render :ascii, padding: [0, 2, 0, 2] do
    border.separator = :each_row
  end
end

def prompt
  pastel = Pastel.new
  shell = TTY::Shell.new
  shell.ask pastel.green.on_black.bold("Shuffle Again? (y/n) OR Print? (p)") do
    argument :required
    default "y"
  end.read_string
end

run = true
data = Dinner.week(3)
draw_table(data)

while run
  input = prompt
  if input == "y"
    data = Dinner.week(3)
    draw_table(data)
  elsif input == "n"
    run = false
  elsif input == "p"
    DinnerSchedule.new(data).render_file "DinnerSchedule.pdf"
    system("open DinnerSchedule.pdf")
    run = false
  end
end
