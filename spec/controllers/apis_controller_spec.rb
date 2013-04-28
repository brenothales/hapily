require 'spec_helper'

describe ApisController do
  after(:all) do
    Api.delete_all
    User.delete_all
    Category.delete_all
  end

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
    it "filters by the specified filter" do
      category = FactoryGirl.create(:category)
      get :index, tag: category
      response.should be_success
    end
    it "renders Ajax requests correctly" do
      xhr :get, :index
      response.should be_success
    end
  end

  describe "GET #new" do
    login_user
    it "creates a @cat_array from categories in database" do
      5.times do |i|
        FactoryGirl.create(:category)
        assigns(:category)
      end
      categories = Category.all
      cat_array = []
      categories.each do |cat|
        cat_array.push(cat.name)
      end
      cat_array.sort_by! { |c| c.downcase }
      cat_array.length.should eq 5
    end
    it "assigns a name, description, category and url to the new api" do
      get :new
      assigns(:api).should_not be_nil
    end
  end

  describe "POST #create" do
    login_user
    context "with valid attributes" do
      it "saves the new api to the database" do
        expect {
          post :create, api: FactoryGirl.attributes_for(:api)
        }.to change(Api, :count).by(1)
      end
      it "sends a mailer" do #not sure how to test if a mailer was sent with delayed jobs
        valid_api = FactoryGirl.create(:api)
        valid_api.save
        ApiMailer.delay.submit_api(valid_api)
        ApiMailer.stub(:delay).and_return(ApiMailer)
        ApiMailer.should_receive(:submit_api).with(valid_api)
      end
      it "redirects to the api show page for that api" do
        post :create, api: FactoryGirl.attributes_for(:api)
        response.should redirect_to api_path(id: Api.last.id)
      end

      it "shows the flash notice" do
        post :create, api: FactoryGirl.attributes_for(:api)
        assigns(:api)
        flash[:notice].should_not be_nil
      end
      end
    end

    context "with invalid attributes" do
      invalid_api = FactoryGirl.build(:api, name: "", description: "")
      it "does not save the new api to the database" do
        invalid_api.save.should eq false
      end
      it "should stay on the form page" do
        invalid_api.save
        response.should_not redirect_to api_path(id: Api.last.id)
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
    FactoryGirl.create(:api)
    context "with matching search results" do
      it "should assign matching results to @results" do
        query = Api.last.name
        @results = Api.where("name ILIKE ?", query).all
        @results.count.should eq 1
      end
    end

    context "with no matching results" do
      query = "foobarbaz"
      @results = Api.where("name ILIKE ?", query)
      it "should not add any APIs to @results" do
        @results.nil?.should eq true
      end
      it "should show the flash[:error]" do
        flash.should_not be_nil
      end
    end
  end
end