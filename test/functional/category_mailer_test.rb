require 'test_helper'

class CategoryMailerTest < ActionMailer::TestCase
  test "submit_category" do
    mail = CategoryMailer.submit_category
    assert_equal "Submit category", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
