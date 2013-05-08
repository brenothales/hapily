class Api < ActiveRecord::Base
  
  attr_accessible :category, :description, :favorites, :name, :url, :votes
  
  validates_presence_of :name, :description, :category, :url
  validates :url, :format => URI::regexp(%w(http https))
  validates :name, :uniqueness => true
  
  has_many :votes
  has_many :reviews
  
  def average_rating
    reviews = self.reviews
    review_sum = reviews.inject(0) { |sum, review| sum += review.rating }
    avg_rating = (review_sum / reviews.count).to_i unless review_sum == 0
  end

end
