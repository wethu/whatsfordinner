require 'date'
require 'yaml'
require 'prawn'

# Extentions
Dir['lib/*.rb'].each { |f| load f }

# Models
autoload(:Persistence, './models/persistence.rb')
Dir['models/*.rb'].each { |f| require_relative f }
Dir['views/*.rb'].each { |f| require_relative f }
