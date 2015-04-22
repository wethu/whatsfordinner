class Dinner
  @@serial_id = 0
  attr_accessor :name, :protein, :ingredients, :prep_time

  def id
    @id
  end

  def add_ingredient(value)
    ingredients.push(value)
  end

end
