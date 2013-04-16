class Review < ActiveRecord::Base
  attr_accessible :rating, :thoughts, :user_id, :api_id
  
  belongs_to :api
  belongs_to :user
end
