class Persistence < Array

  attr_reader :data


  # def initialize(store_path)
  #   # yaml = YAML::load_file(store_path)
  #   # DinnerList.new(yaml)
  # end

  def delete
  end

  def update
  end

  def find(*)
  end

  private

  def update_store!
    store { |s| s.write @data.to_yaml } if valid?
  end

  def store
    File.open('../db/dinners.yml', 'w')
  end

end
