require 'spec_helper'

describe ReviewsController do
  before(:each) do
    @api = FactoryGirl.create(:api, id: 1)
  end
  after(:each) do
    Api.delete_all
    Review.delete_all
  end
  describe "GET #new" do
    context "user signed in" do
      it "should show 'Add Review' button" do
        visit apipage_path(id: 1)
        page.should have_content('Add a review')
      end
      it "should assign a new review to @review" do
        get :new
        assigns(:review).should_not be_nil
      end
    end

    context "user not signed in" do
      it "should show sign in link" do
        visit apipage_path(id: 1)
        page.should have_content('Sign in to add a review')
      end
      it "should redirect to sign in page if user clicks sign in link" do
        click_link("Sign in")
        response.should redirect_to new_user_session_path
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "should save the review to the database" do
         expect {
           @api.reviews.create rating: 5, thoughts: "lorem ipsum"
         }.to change(Review,:count).by(1)
      end
      it "should show the flash[:notice]" do
        post :create, review: FactoryGirl.attributes_for(:review)
        assigns(:review)
        flash[:notice].should_not be_nil
      end

    end

    context "with invalid attributes" do
      it "should not save the review" do
        expect {
          @api.reviews.create rating: 4, thoughts: nil
        }.to_not change(Review, :count)
      end
      it "should show the flash[:error]" do
        post :create, review: FactoryGirl.attributes_for(:review, rating: nil, thoughts: "")
        assigns(:review)
        flash[:error].should_not be_nil
      end
    end

    it "should respond to Ajax"
  end
end