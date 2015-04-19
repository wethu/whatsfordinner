class DinnerList < Array
  def find(name)
    raise self.inspect
    self.select {|d| d.name.include? name }
  end
end
