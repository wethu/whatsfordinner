require 'date'
require 'yaml'
require 'prawn'
require 'pry'

# Extentions
Dir['lib/*.rb'].each { |f| require_relative f }

# Models
autoload(:Persistence, './models/persistence.rb')
Dir['models/*.rb'].each { |f| require_relative f }
Dir['views/*.rb'].each { |f| require_relative f }
