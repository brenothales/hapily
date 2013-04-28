require 'spec_helper'

describe CategoriesController do

  describe "GET #new" do
     it "assigns a new category to @category" do
       get :new
       assigns(:category).should_not be_nil #how else can I text that the category was created? this is probably not the most efficient way
     end
  end

  describe "POST #create" do
    it "responds to Ajax request" do #not sure how to test this correctly
      xhr :get, :create
      response.should redirect_to new_api_path
    end

    context "with valid attributes" do
      it "creates a new category and saves to the database" do
        expect{
          post :create, category: FactoryGirl.attributes_for(:category)
        }.to change(Category,:count).by(1)
      end
    end

    context "with invalid attributes" do
      it "doesn't save the new category" do
        expect{
          post :create, category: FactoryGirl.attributes_for(:category, name: "")
        }.to_not change(Category, :count)
      end
    end
  end
end