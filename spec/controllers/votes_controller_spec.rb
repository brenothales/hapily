require 'spec_helper'

describe VotesController do

    describe "POST #create" do
      context "signed in user" do
        it "should redirect to root path if already_voted_on?"
        it "should create a new vote and save to the database"
        it "should redirect to root path after creating a vote"
      end

      context "not signed in" do
        it "should show a flash error with sign in link"
      end
    end
end