require 'spec_helper'

describe User do
  it { should have_many :votes }
  it { should have_many :reviews }
end

describe "#already_voted_on?" do
  it "should get the votes for each user" do
    vote = FactoryGirl.create(:vote)
    user = FactoryGirl.create(:user, id: 1)
    api = FactoryGirl.create(:api, id: 1)
    user.votes.where(api_id: 1).count.should eq 1
  end
  it "should be true if user has already voted on the API" do
    api_with_votes = FactoryGirl.create(:api, id: 1)
    api_with_votes.votes.create api_id: 1, user_id: 1
    user_with_votes = FactoryGirl.create(:user, id: 1)
    
    user_with_votes.already_voted_on?(api_with_votes).should eq true
  end
  
  it "should be false if user has not voted on the API" do
    user_without_vote = FactoryGirl.create(:user)
    new_api = FactoryGirl.create(:api)
    
    user_without_vote.already_voted_on?(new_api).should eq false
  end
end