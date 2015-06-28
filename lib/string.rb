class String
  def titleize
    # deunderscore.split(' ').map { |s| s.gsub(/\b[a-z]/, s[0].upcase) }
    deunderscore.gsub(/\b[a-z]/) { $&.capitalize }
  end

  private
  def deunderscore
    self.gsub('_', ' ')
  end
end
