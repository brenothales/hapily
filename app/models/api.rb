class Api < ActiveRecord::Base
  attr_accessible :category, :description, :favorites, :name, :url
  
  validates_presence_of :name, :description, :category, :url
end
