require 'spec_helper'

describe "Users" do
 
  subject { page }
  
  describe "user pages" do
    
    user = FactoryGirl.create(:user)
    second_user = FactoryGirl.create(:user, name: "Sara", id: 3, email: "sararob@brandeis.edu")
    
    before(:each) do
      visit all_users_path
    end
    
    describe "pagination" do
      
      it "should list each user" do
        User.paginate(page: 1).each do |user|
          page.should have_link(user.name, href: profile_path(user_id: user.id))
          
          page.should have_link(second_user.name, href: profile_path(user_id: second_user.id))
        end
      end 
    end
    
    describe "user show page" do
      
    end
  end
end

#Add tests to make sure signed in users see the right header links