class Api < ActiveRecord::Base
  
  attr_accessible :category, :description, :favorites, :name, :url, :votes
  
  validates_presence_of :name, :description, :category, :url
  validates :url, :format => URI::regexp(%w(http https))
  validates :name, :uniqueness => true
  
  has_many :votes
end
