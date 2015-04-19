class Dinner < Persistence
  attr_accessor :ingredients, :protein, :prep_time, :name

  def initialize(data = {})

    unless (data.empty?)
      self.name = data[0].to_s.titleize
      self.ingredients = data[1][:ingredients]
      self.protein = data[1][:protein].to_s
      self.prep_time = data[1][:time]
    end
  end

  def add_ingredient(value)
    ingredients.push(value)
  end
end
