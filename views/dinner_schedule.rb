require 'prawn'
class DinnerSchedule < Prawn::Document

  def initialize(dinners)
    super({
      :page_size => 'EXECUTIVE',
      :page_layout => :landscape
    })
    define_grid(:columns => 7, :rows => 3, :gutter => 5)
    dinners.each_with_index { |week, row| draw_week(week, row) }
  end

  private
  def draw_week(week, row)
    week.each_with_index do |dinner, index|
      dinner = DinnerCell.new(dinner)
      day = Date::DAYNAMES[index]
      grid([row, index], [row, index]).bounding_box do
        pad_top(6) { text day, :align => :center, :size => 10 }

        text "#{dinner.name}", :align => :center, :size => 12
        stroke_horizontal_rule
        move_down 5

        dinner.ingredients.each do |i, v|
          value = "• #{add_spices(v)} #{i.to_s.titleize}"
          indent(5) { text value, :align => :left, :size => 8 }
        end
        stroke_bounds
      end
    end
  end

  # if true, render "Add"
  def add_spices(value)
    value.kind_of?(TrueClass) ? "Add" : value
  end
end
