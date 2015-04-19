class Dinner
  attr_accessor :ingredients, :protein, :prep_time, :name

  def initialize
    @ingredients ||= []
  end
  def ingredients=(value)
    ingredient.push(value)
  end
end
