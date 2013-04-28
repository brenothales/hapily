require 'spec_helper'

describe UsersController do
  
  describe "User pages" do
    user = FactoryGirl.create(:user)

  describe "User show page" do
    it "fetches the right current user" do
      User.find(user.id).should eq user
    end

    it "show the right created at date" do
      current_date = Time.now.strftime("%B %d, %Y")
      user.created_at.strftime("%B %d, %Y").should eq current_date
    end

    it "renders the show view" do
      get :show, id: user.id
      response.should render_template :show
    end
  end

  describe "User index page" do
    it "should render the index view" do
      get :index
      response.should render_template :index
    end
  end
  end
end
