class Api < ActiveRecord::Base
  attr_accessible :category, :description, :favorites, :name, :url
end
