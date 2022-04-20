class PasswordsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        @user = User.find_by(email: params[:email])
        PasswordResetMailer.with(user: @user).password_reset_email.deliver_later

        render json: {message: "Password Reset email sent"}
    end
end
