require 'spec_helper'

describe UsersHelper do
  user_with_gravatar = User.new name: 'Test User', email: 'sararob@brandeis.edu', password: 'foobarbaz'
  gravatar_id = Digest::MD5::hexdigest(user_with_gravatar.email.downcase)
  size = 75
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  it "should pull the User's image from Gravatar" do
    gravatar_for(user_with_gravatar).should_not be_nil
  end

  it "should find the user's gravatar id" do
    gravatar_id.should_not be_nil
  end

  it "should create the correct url given the id and size" do

    gravatar_url.should eq "https://secure.gravatar.com/avatar/#{gravatar_id}?s=75"
  end

  it "should create an image tag from the url" do
    image_tag(gravatar_url).should_not be_nil
  end
end