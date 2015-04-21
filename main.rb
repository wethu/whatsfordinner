#!/usr/bin/env ruby
load 'init.rb'

class Main
  def initialize
    @persistent_store ||= Persistence.new('db/dinners.yml')
  end

  # TODO Extract all this out into a prawn class, include Prawn::View
  def render
    Prawn::Document.generate('dinners.pdf', :page_size => 'EXECUTIVE',
      :page_layout => :landscape) do |pdf|

      pdf.define_grid(:columns => 7, :rows => 3, :gutter => 5)
      Date::DAYNAMES.each_with_index do |day, i|
        pdf.grid([0,i],[0,i]).bounding_box do

          pdf.pad_top(6) { pdf.text day, :align => :center, :size => 10 }
          pdf.text "#{dinners[i].name}", :align => :center, :size => 12
          pdf.stroke_horizontal_rule
          pdf.move_down 5

          dinners[i].ingredients.each do |i, v|
            text = "• #{humanize(v)} #{i.to_s.titleize}"
            pdf.indent(5) { pdf.text text, :align => :left, :size => 8 }
          end
          pdf.stroke_bounds
        end

        pdf.grid([1,i],[1,i]).bounding_box do
          pdf.text day, :align => :center
          pdf.stroke_bounds
        end

      end
    end
  end

  private

  def dinners
    @persistent_store.data
  end

  def humanize(value)
    value.kind_of?(TrueClass) ? "Add" : value
  end

end

main = Main.new
main.render
