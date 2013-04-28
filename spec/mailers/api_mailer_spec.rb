require 'spec_helper'

describe ApiMailer do
  describe '#submit_api' do
    api_to_email = FactoryGirl.create(:api)
    @user = FactoryGirl.create(:user, id: 1)
    let(:mail) { ApiMailer.submit_api(api_to_email)}

    it "should send the email to me" do
      mail.to.should eq ["sararob@brandeis.edu"]
    end

    it "should have the right subject" do
      mail.subject.should eq api_to_email.name + ' added to hapily'
    end

    it "has @api in the email body" do
      mail.body.raw_source.should include api_to_email.name
    end

    it "has the external API url in the email body" do
      mail.body.raw_source.should include api_to_email.url
    end

    it "has @url in the email body" do
      mail.body.raw_source.should include "http://hapily.herokuapp.com/apis/show/" + api_to_email.id.to_s
    end

    it "has the API category in the email body" do
      mail.body.raw_source.should include api_to_email.category
    end
  end
end