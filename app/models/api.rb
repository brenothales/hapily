class Api < ActiveRecord::Base
  
  attr_accessible :category, :description, :name, :url, :votes
  
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

  def company_name
    name = (self.name).split[0]
  end

  def company_description
    crunchbase_call = JSON.parse(HTTParty.get("http://api.crunchbase.com/v/1/search.js?query=" + self.company_name + "&api_key=cqrfqwqejevgnp6vbxd85mng").response.body)
    description = (crunchbase_call["results"][0]["overview"])
    period = description.index(". ")
    description[0..period]
  end
end
