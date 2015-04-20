#!/usr/bin/env ruby
load 'init.rb'

class Main
  def initialize
    @persistent_store = Persistence.new('db/dinners.yml')
  end

  def dinners
    @persistent_store.data
  end

  def render
    # Prawn::Document.generate('dinners.pdf',
    #   :page_size => 'EXECUTIVE',
    #   :page_layout => :landscape) do

    Calender.generate('dinners.pdf',
                      :page_size => 'EXECUTIVE',
                      :page_layout => :landscape) do
      define_grid(:columns => 7, :rows => 4)

      Date::DAYNAMES.each_with_index do |day, i|
        grid([0,i],[0,i]).bounding_box do
          text day, :align => :center
          stroke_bounds
        end

        grid([1,i],[1,i]).bounding_box do
          text day, :align => :center
          stroke_bounds
        end

        grid([2,i],[2,i]).bounding_box do
          text day, :align => :center
          stroke_bounds
        end

        grid([3,i],[3,i]).bounding_box do
          text day, :align => :center
          stroke_bounds
        end
      end
    end
  end

  def test
    puts dinners.to_yaml
  end
end

main = Main.new
main.render
