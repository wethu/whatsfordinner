class DinnerCell

  delegate :ingredients, :to => :@dinner

  def initialize(dinner)
    @dinner = dinner
  end

  def name
    @dinner.name.to_s.titleize
  end

end
