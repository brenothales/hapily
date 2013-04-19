class ApiMailer < ActionMailer::Base
  default from: "hapily@hapily.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.api_mailer.submit_api.subject
  #
  def submit_api(api)
    @api = api
    @url = "http://hapily.herokuapp.com/apis/show/" + @api.id.to_s
    mail(to: "sararob@brandeis.edu", subject: @api.name + " added to hapily")
  end
end
