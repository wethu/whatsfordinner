class Recipe < ActiveRecord::Base
  belongs_to :dinners
  serialize :ingredients
end
