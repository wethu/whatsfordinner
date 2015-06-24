# FIXME: inherit from prawn
class WeeklyDinners


  def render
    Prawn::Document.generate('dinners.pdf', :page_size => 'EXECUTIVE',
      :page_layout => :landscape) do |pdf|

      pdf.define_grid(:columns => 7, :rows => 3, :gutter => 5)

      week1 = Dinner.week
      week2 = Dinner.week
      week3 = Dinner.week

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

  private
  # FIXME: Move me/rethink?
  def humanize(value)
    value.kind_of?(TrueClass) ? "Add" : value
  end
end
