require 'spec_helper'

describe User do
  it { should have_many :votes }
  it { should have_many :reviews }
end

describe "#already_voted_on?" do
  it "should be true if user has already voted on the API" do
    user_with_vote = FactoryGirl.create(:user, id: 1)
    already_voted = FactoryGirl.create(:vote)
    test_api = FactoryGirl.create(:api, id: 1)
    
    user_with_vote.already_voted_on?(test_api).should eq true
  end
  
  it "should be false if user has not voted on the API" do
    user_without_vote = FactoryGirl.create(:user)
    new_api = FactoryGirl.create(:api)
    
    user_without_vote.already_voted_on?(new_api).should eq false
  end
end