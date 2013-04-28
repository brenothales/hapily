require 'spec_helper'

describe VotesController do

    describe "POST #create" do
    before(:each) do
      @api = FactoryGirl.create(:api, id: 1)
    end
    after(:all) do
      Vote.delete_all
    end
      context "signed in user" do
        login_user
        context "already_voted_on? eq true" do
          it "should assign already_voted_on? to true if user has voted on the api" do
            subject.current_user.votes.create api_id: 1, user_id: subject.current_user.id
            subject.current_user.already_voted_on?(1).should eq true
         end
          it "should show the flash[:error]" do
            post :create, api_id: 1, vote: FactoryGirl.attributes_for(:vote, user_id: subject.current_user.id)
            assigns(:vote)
            flash.should_not be_nil
          end
          it "should redirect to the root path if already_voted_on?" do
            post :create, api_id: 1, vote: FactoryGirl.attributes_for(:vote, user_id: subject.current_user.id)
            assigns(:vote)
            response.should redirect_to root_path
          end
        end

        context "already_voted_on? eq false" do
          it "should create a new vote and save to the database" do
            expect{
              post :create, api_id: 1, vote: FactoryGirl.attributes_for(:vote)
            }.to change(Vote, :count).by(1)
          end
          it "should display the flash[:notice]"do
            post :create, api_id: 1, vote: FactoryGirl.attributes_for(:vote)
            assigns(:vote)
            flash.should_not be_nil
          end
          it "should redirect to root path after creating a vote" do
            post :create, api_id: 1, vote: FactoryGirl.attributes_for(:vote)
            assigns(:vote)
            response.should redirect_to root_path
          end
        end
      end

      context "not signed in" do
        it "should show a flash error with sign in link" do
          #need to simulate someone clicking on votes path
        end
      end
    end
end