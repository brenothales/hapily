class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  
  has_many :votes
  has_many :reviews
  
  default_scope order('sign_in_count desc')
  
  def already_voted_on?(api_id)
    self.votes.where(api_id: api_id).count > 0
  end
end
