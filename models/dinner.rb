class Dinner < ActiveRecord::Base
  has_one :recipe

  serialize :ingredients, Hash

  class << self
    def week(multiple = 1)
      collection = all.shuffle.to_a
      multiple.times.reduce([]) do |memo, _dinner|
        memo << collection.slice!(0..6)
      end
    end
  end
end
