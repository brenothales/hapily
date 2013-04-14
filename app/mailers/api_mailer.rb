class ApiMailer < ActionMailer::Base
  default from: "hapily@hapily.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.api_mailer.submit_api.subject
  #
  def submit_api()
    @greeting = "Hi"

    mail to: "sararob@brandeis.edu", subject: "API Submission"
  end
end
