require 'spec_helper'

describe ReviewsController do

  describe "GET #new" do
    context "user signed in" do
      it "should show 'Add Review' button" do
        get :show, api_id: 1
        it { should.have_selector('a', text: 'Add a review')}
      end
      it "should assign a new review to @review" do
        get :new
        assigns(:review).should_not be_nil
      end
    end

    context "user not signed in" do
      it "should not show 'Add Review' button"
      it "should show sign in link"
      it "should redirect to sign in page if user clicks sign in link"
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "should save the review to the database"
      it "should respond to Ajax"
    end

    context "with invalid attributes" do
      it "should not save the review"
    end
  end
end