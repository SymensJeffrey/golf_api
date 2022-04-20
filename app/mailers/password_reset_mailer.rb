class PasswordResetMailer < ApplicationMailer
    default from: ENV["GMAIL_USERNAME"]

  def password_reset_email
    @user = params[:user]
    @url  = ENV["PASSWORD_RESET_URL"]
    mail(to: @user.email, subject: 'Password Reset')
  end
end
