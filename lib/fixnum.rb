class Fixnum
  def hour
    self * 60 * 60
  end

  def minute
    self * 60
  end

  def second
    self
  end
end
