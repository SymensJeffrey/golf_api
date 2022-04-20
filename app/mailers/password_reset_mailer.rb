class PasswordResetMailer < ApplicationMailer
    default from: 'jeffrey.symens23@gmail.com'

  def password_reset_email
    @user = params[:user]
    @url  = 'http://localhost:8080/login'
    mail(to: @user.email, subject: 'Password Reset')
  end
end
