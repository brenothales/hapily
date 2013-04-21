class Category < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :uniqueness => { :case_sensitive => false, :message => "That category already exists."}, :presence => true
end
