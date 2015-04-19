class String
  def titleize
    deunderscore.split(' ').each { |s| s.gsub!(/\b[a-z]/, s[0].upcase!) }.join(' ')
  end

  private
  def deunderscore
    self.gsub('_', ' ')
  end
end
