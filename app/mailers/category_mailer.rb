class CategoryMailer < ActionMailer::Base
  default from: "hapily@hapily.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.category_mailer.submit_category.subject
  #
  def submit_category(category)
    @category = category
    mail(to: "sararob@brandeis.edu", subject: @category.name + " added to hapily")
  end
end
