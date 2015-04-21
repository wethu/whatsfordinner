class DinnerList < Array

  # TODO: Implement this into randomizer
  # Amount of times per week you want a certain kind of protein
  PROTEIN_FREQ = {
    :chicken => 3,
    :pork => 2,
    :beef => 2,
    :fish => 3
  }

  # FIXME: This actually doesn't grab a random set or week, just first 7
  def week
    shuffle.slice!(0..6)
  end

end
