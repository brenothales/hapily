require 'spec_helper'

describe "Static Pages" do
  
  subject { page }
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_content('directory of APIs') }
    it { should have_selector('h2', text: 'About hapily') }
    it { should have_selector('h3', text: 'Donate $5') }
  end 
end
