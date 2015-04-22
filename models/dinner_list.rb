class DinnerList < Persistence

  # TODO: Implement this into randomizer
  # Amount of times per week you want a certain kind of protein
  PROTEIN_FREQ = {
    :chicken => 3,
    :pork => 2,
    :beef => 2,
    :fish => 3
  }

  STORE = YAML::load_file('db/dinners.yml')

  def initialize
    super(STORE)
  end

  def week
    shuffle!.slice!(0..6)
  end

end
