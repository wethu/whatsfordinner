class Dinner
  attr_accessor :ingredients, :protein, :prep_time, :name

  def initialize(data = nil)

    unless (data.nil?)
      @name = data[0].to_s.titleize
      @ingredients = data[1][:ingredients].first
      @protein = data[1][:protein].to_s
      @prep_time = data[1][:time]
    end
  end

  def add_ingredient(value)
    ingredients.push(value)
  end
end
