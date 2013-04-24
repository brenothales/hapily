require 'spec_helper'

describe UsersController do
  render_views
  
  describe "users profile page (show)" do
    before(:each) do
      @user = FactoryGirl.build(:user, name: "Sara", email: "sararob@brandeis.edu")
    end
    
    it "should have the right name" do
      @user.name.should eq "Sara"
    end
    
    it "should have the right email" do
      @user.email.should eq "sararob@brandeis.edu"
    end
  end
    
end
