require 'spec_helper'

describe "Users" do
 
  subject { page }
  
  describe "users index page" do
    
    let(:user) { FactoryGirl.create(:user) }
    
    before(:all) { 30.times { FactoryGirl.create(:user) } }
    after(:all) { User.delete_all }
    
    before(:each) do
      new_user_session user
      visit all_users_path
    end
    
    describe "pagination" do
      User.paginate(page: 1).each do |user|
        page.should have_link(user.name, href: profile_path(user_id: user.id))
        page.should have_content(user.name)
      end 
    end
  end
end
