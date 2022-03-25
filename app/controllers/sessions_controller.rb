class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
          jwt = JWT.encode(
            {
              user_id: user.id, # the data to encode
              exp: 24.hours.from_now.to_i # the expiration time
            },
            Rails.application.credentials.fetch(:secret_key_base), # the secret key
            "HS256" # the encryption algorithm
          )
          render json: { jwt: jwt, email: user.email, user_id: user.id, role:user.role }, status: :created
        else
          render json: {}, status: :unauthorized
        end
    end
end
