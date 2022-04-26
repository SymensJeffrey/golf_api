class PasswordsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        @user = User.find_by(email: params[:email])
        @user.reset_password_token = SecureRandom.hex(3)
        @user.save
        PasswordResetMailer.with(user: @user).password_reset_email.deliver_later

        render json: {message: "Password Reset email sent"}
    end

    def update
        user = User.find_by(reset_password_token: params[:reset_password_token])
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation] 
        user.save
        if user.save
            render json: { message: "Password Updated successfully" }
          else
            render json: { errors: user.errors.full_messages }, status: :bad_request
        end
    end
end
