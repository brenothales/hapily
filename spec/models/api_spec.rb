require 'spec_helper'

describe Api do
  it { should have_many :votes }
  it { should have_many :reviews }
  
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :category }
  it { should validate_presence_of :url }
  it { should validate_uniqueness_of :name }
  
  context "validates url" do
    it "should not save" do
      invalid_api = Api.new name: 'Fake API', description: 'It does something', category: 'Fake category', url: 'www.example.com'
      invalid_api.save.should eq false
    end
    it "should save" do
      valid_api = Api.new name: 'Fake API', description: 'It does something', category: 'Fake category', url: 'http://www.example.com'
      valid_api.save.should eq true
    end  
  end
  
  describe "#average_rating" do
    it "should be nil when there are no reviews" do
      api_without_reviews = Api.new name: 'Fake API', description: 'It does something', category: 'Fake category', url: 'http://www.example.com'
      api_without_reviews.average_rating.should be_nil
    end
    it "should calculate average rating properly" do
      api_with_reviews = Api.new name: 'Fake API', description: 'It does something', category: 'Fake category', url: 'http://www.example.com'
      api_with_reviews.save
      api_with_reviews.reviews.create rating: Random.rand(1..5), thoughts: 'blah'
      api_with_reviews.reviews.create rating: Random.rand(1..5), thoughts: 'blah'
      average = api_with_reviews.reviews.inject(0) { |sum, review| sum += review.rating } / api_with_reviews.reviews.count
      api_with_reviews.average_rating.should eq average
    end
  end
end