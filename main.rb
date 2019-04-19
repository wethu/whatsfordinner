#!/usr/bin/env ruby
load "init.rb"

def draw_table(data)
  table = TTY::Table.new(
    header: Date::DAYNAMES,
    rows: data.map { |r| r.map(&:name) }
  )
  puts table.render :ascii, padding: [0, 2, 0, 2] do
    border.separator = :each_row
  end
end

def prompt
  pastel = Pastel.new
  shell = TTY::Prompt.new
  choices = %w(Yes No Print)
  shell.enum_select(pastel.green.on_black.bold("Shuffle Again?"), choices)
end

run = true
draw_table(Dinner.week(3))

while run
  case prompt
  when "Yes"
    draw_table(Dinner.week(3))
  when "Print"
    DinnerSchedule.new(data).render_file "DinnerSchedule.pdf"
    system("open DinnerSchedule.pdf")
    run = false
  else
    run = false
  end
end
