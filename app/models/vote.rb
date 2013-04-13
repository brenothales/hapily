class Vote < ActiveRecord::Base
  attr_accessible :api_id, :user_id, :vote_id, :value
  
  belongs_to :api
  belongs_to :user
end
