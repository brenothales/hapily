class Vote < ActiveRecord::Base
  attr_accessible :api_id, :user_id, :vote_id
  
  belongs_to :voteable, :polymorphic => true
end
