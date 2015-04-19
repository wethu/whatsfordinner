#!/usr/bin/env ruby
load 'init.rb'

class Main
  def initialize
    @persistent_store = Persistence.new('db/dinners.yml')
  end

  def dinners
    @persistent_store.data
  end

  def test
    puts dinners.to_yaml
  end
end

main = Main.new
main.test
