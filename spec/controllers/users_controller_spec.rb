require 'spec_helper'

describe UsersController do
  login_user
  
  describe "User pages" do

  describe "User show page" do
    it "assigns the right user to @current_user" do
      User.find(subject.current_user.id).should eq subject.current_user
    end

    it "assigns the right date to @member_since" do
      current_date = Time.now.strftime("%B %d, %Y")
      subject.current_user.created_at.strftime("%B %d, %Y").should eq current_date
    end
  end

  describe "User index page" do
    it "should render the index view" do
      get :index
      response.should render_template :index
    end

    it "should paginate 10 users per page" do
      30.times { FactoryGirl.create(:user) }
      visit all_users_path
      page.should have_selector('div.pagination')
    end
  end
  end
end
