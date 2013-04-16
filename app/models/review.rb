class Review < ActiveRecord::Base
  attr_accessible :rating, :thoughts
  
  belongs_to :api
  belongs_to :user
end
