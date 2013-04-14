require 'test_helper'

class ApiMailerTest < ActionMailer::TestCase
  test "submit_api" do
    mail = ApiMailer.submit_api
    assert_equal "Submit api", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
