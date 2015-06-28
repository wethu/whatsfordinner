class Dinner < ActiveRecord::Base

  has_one :recipe

  serialize :ingredients, Hash

  def self.week(multiple = false)
    return Dinner.mix.each_slice(7).to_a.slice(0..multiple) if multiple
    Dinner.mix.slice(0..6)
  end

  private

  def self.mix
    return all.shuffle.to_a
  end
end
