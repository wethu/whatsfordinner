require 'date'
require 'yaml'
require 'prawn'
require 'pry'
require 'active_record'
require 'sqlite3'
require 'logger'
require 'curses'
ActiveRecord::Base.logger = Logger.new('log/debug.log')
configuration = YAML::load(IO.read('db/database.yml'))
ActiveRecord::Base.establish_connection(configuration['development'])

# Extentions
Dir['lib/*.rb'].each { |f| require_relative f }

# Models
Dir['models/*.rb'].each { |f| require_relative f }
Dir['views/*.rb'].each { |f| require_relative f }

