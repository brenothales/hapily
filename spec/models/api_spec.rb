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
    before(:each) do
      @api = FactoryGirl.create(:api)
    end

    it "should get the reviews for each api" do
      api_has_reviews = FactoryGirl.create(:api)
      api_has_reviews.reviews.create rating: 5, thoughts: 'blahblah'
      api_has_reviews.reviews.count.should eq 1
    end
    it "should be nil when there are no reviews" do
      @api.average_rating.should be_nil
    end
    it "should calculate average rating properly" do
      [1,5].each do |r|
        FactoryGirl.create(:review, rating: r, api: @api)
      end
      @api.average_rating.should eq 3
    end
  end
end