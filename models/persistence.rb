class Persistence < Array

  def self.store_path(path)
    @store_path=(path)
  end

  def self.add_to_store(object)
    list = DinnerList.new.push(object)
    if Dinner.find(object.id).nil?
      list.update_store!
    end
  end

  def update_store!
    File.open('db/dinners.yml', 'w') { |s| s.write self.to_yaml }
  end

end
