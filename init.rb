require 'date'
require 'yaml'

# Extentions
Dir['lib/*.rb'].each { |f| load f }

# Models
autoload(:Persistence, './models/persistence.rb')
Dir['models/*.rb'].each { |f| require_relative f }
