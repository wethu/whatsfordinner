class Dinner < ActiveRecord::Base
  serialize :ingredients, Hash
  # FIXME: No duplicates
  def self.week
    all.shuffle.slice(0..6)
  end
end
