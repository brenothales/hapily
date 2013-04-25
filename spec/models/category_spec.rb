require 'spec_helper'

describe Category do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).case_insensitive }
  
  context "validates name uniqueness" do
    it "should not save" do
      first_category = Category.new name: 'Test Category'
      first_category.save
      
      invalid_category = Category.new name: 'Test Category'
      invalid_category.save.should eq false
    end
    it "should save" do
      valid_category = Category.new name: 'Unique Category'
      valid_category.save.should eq true
    end  
  end
end