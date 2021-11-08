class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Your Interview Has been succesfully scheduled')
  end
end
