class UserMailer < ApplicationMailer
  def user_confirmation
    @user = params[:user]
    mail(to: @user.email, subject: 'Your Interview Has been succesfully scheduled')
  end

  def admin_confirmation
    @user = params[:user]

    mail(to: 'zlpinterviewer@gmail.com', subject: 'An Interview Has been succesfully scheduled')
  end
end
