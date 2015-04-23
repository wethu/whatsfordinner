#!/usr/bin/env ruby
load 'init.rb'

class Main

  # TODO: Extract all this out into a prawn class, include Prawn::View
  def render
    Prawn::Document.generate('dinners.pdf', :page_size => 'EXECUTIVE',
      :page_layout => :landscape) do |pdf|

      pdf.define_grid(:columns => 7, :rows => 3, :gutter => 5)

      week1 = dinners.week
      week2 = dinners.week
      week3 = dinners.week

      # WEEEEEEEEEEEEE! loops !
      Date::DAYNAMES.each_with_index do |day, i|
        [week1, week2, week3].each_with_index do |week, j|
          pdf.grid([j,i],[j,i]).bounding_box do

            pdf.pad_top(6) { pdf.text day, :align => :center, :size => 10 }
            pdf.text "#{week[i].name}", :align => :center, :size => 12
            pdf.stroke_horizontal_rule
            pdf.move_down 5

            week[i].ingredients.each do |i, v|
              text = "• #{humanize(v)} #{i.to_s.titleize}"
              pdf.indent(5) { pdf.text text, :align => :left, :size => 8 }
            end
            pdf.stroke_bounds
          end
        end
      end

    end
  end

  # FIXME REMOVE!
  def test_store
    puts Dinner.find(1).inspect
    d = Dinner.new
    d.name = "Soup"
    d.ingredients = {
      :chicken_breast => 1,
      :carrot => 2,
      :potato => 3,
      :onion => 1,
      :cellery => 1,
      :spices => true
    }
    d.prep_time = 1.hour
    d.id = DinnerList.new.count
    d.save
  end

  private

  def dinners
    @dinners ||= DinnerList.new
  end

  def humanize(value)
    value.kind_of?(TrueClass) ? "Add" : value
  end


end

main = Main.new
main.render
main.test_store #FIXME REMOVE!
