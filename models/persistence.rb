class Persistence

  attr_reader :data

  def initialize(store_path)
    @data = YAML::load_file(store_path)
    @data = DinnerList.new(@data)
  end

  def delete
  end

  def update
  end

  private

  def update_store!
    store { |s| s.write @data.to_yaml } if valid?
  end

  def store
    File.open('../db/dinners.yml', 'w')
  end
end
