class String
  def titleize
    self.split(' ').each { |s| s.gsub!(/^./, s[0].upcase!) }
  end
end
