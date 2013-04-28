require 'spec_helper'

describe CategoryMailer do
  describe '#submit_category' do
    category = FactoryGirl.create(:category)
    let(:mail) { CategoryMailer.submit_category(category) }

    it "should send the email to me" do
      mail.to.should eq ["sararob@brandeis.edu"]
    end

    it "should have the right subject" do
      mail.subject.should eq category.name + ' added to hapily'
    end

    it "should have the category name in the email" do
      mail.body.raw_source.should include category.name
    end
  end
end