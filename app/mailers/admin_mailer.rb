class AdminMailer < ApplicationMailer
  default from: 'stockapp@noreply.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.account_approve.subject
  #
  def account_approve(user)
    @user = user
    mail(
      from: 'StonksApp<stonksapp@email.com>', 
      to: @user.email, 
      subject: 'Account Approved!'
    )
  end
end
