class Recipe < ActiveRecord::Base
  validates_presence_of :title

  has_many :ingredients
end
