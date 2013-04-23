require 'spec_helper'

describe "Users" do
 
  subject { page }
  
  describe "signup page" do 
    before { visit new_user_registration_path }
      
    it { should have_selector('h2', text: 'Sign up') }
  end
  
  describe "index page" do
    before { visit all_users_path }

  end
end
