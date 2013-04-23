require 'spec_helper'

describe UsersHelper do
  it "should pull the User's image from Gravatar" do
    user_with_gravatar = User.new name: 'Test User', email: 'sararob@brandeis.edu', password: 'foobarbaz'
    gravatar_for(user_with_gravatar).should_not be_nil
  end
end