require 'spec_helper'

describe ApisController do
  before(:each) do
    user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
    it "filters by the specified filter"
    it "renders Ajax requests correctly"
  end

  describe "GET #new" do
    it "creates a categories array and renders it in the dropdown menu"
    it "assigns a name, description, category and url to the new api" do
      get :new
      assigns(:api)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new api to the database" do #throws an undefined method 'authenticate' error because each api has a user_id attribute and it cant find the user...how should i fix this?
        expect {
          post :create, api: FactoryGirl.attributes_for(:api)
        }.should change(Api, :count).by(1)
      end
      it "sends a mailer"
      it "redirects to the api show page for that api"
      end
    end

    context "with invalid attributes" do
      invalid_api = FactoryGirl.build(:api, name: nil, description: nil, category: nil, url: nil)
      it "does not save the new api to the database" do
        expect {
          post :create, api: invalid_api
        }.to_not change(Api, :count)
      it "redirects back to the form page"
    end
  end

  describe "GET #show" do
    valid_api = FactoryGirl.create(:api)
    it "should find the correct api given an ID" do
      Api.find(valid_api.id).should eq valid_api
    end
    it "should render the show view for a given API" do
      get :show, id: valid_api.id
      response.should render_template :show
    end
  end

  describe "GET #search" do
    context "with matching search results" do
      it "should assign matching results to @results"
    end

    context "with no matching results" do
      it "should redirect to root path"
    end
  end
end