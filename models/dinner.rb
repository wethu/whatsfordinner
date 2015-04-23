class Dinner
  attr_accessor :id, :name, :protein, :ingredients, :prep_time

  def self.find(id)
    DinnerList.new.select { |dinner| dinner.id == id }.pop
  end

  def self.find_by_name(name)
    DinnerList.new.select { |dinner| dinner.name.include?(name.to_s.titleize) }
  end

  def save
    DinnerList.add_to_store(self)
  end

end
