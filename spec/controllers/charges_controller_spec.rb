require 'spec_helper'

describe ChargesController do

  describe "POST #create" do

    context "with valid credit card" do
      it "should create a charge"
      it "should save the charge to the database"
    end

    context "with invalid card" do
      it "should show flash error"
      it "should redirect to charges path"
    end
  end
end