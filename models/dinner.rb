class Dinner < ActiveRecord::Base
  has_one :recipe

  serialize :ingredients, Hash

  def self.week(number_of_weeks)
    limit(number_of_weeks * 7).shuffle.each_slice(7).to_a
  end
end
