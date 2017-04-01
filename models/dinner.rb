class Dinner < ActiveRecord::Base
  has_one :recipe

  serialize :ingredients, Hash

  scope :week, ->(amount = 1) {
    limit(amount * 7).order("RANDOM()").each_slice(7).to_a
  }
end
