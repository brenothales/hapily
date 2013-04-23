class Category < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :uniqueness => { :case_sensitive => false }, :presence => true
end
