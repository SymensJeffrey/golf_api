class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          jwt = JWT.encode(
            {
              user_id: user.id, # the data to encode
              exp: 24.hours.from_now.to_i # the expiration time
            },
            Rails.application.credentials.fetch(f149685438a59b95d407399e11b20c2311052231acdc95e5045217588a8b2ab405e34cba1bf5789c7f3681568cd93b315887ed80c4079e5233f2ff222b4c2b2a), # the secret key
            "HS256" # the encryption algorithm
          )
          render json: { jwt: jwt, email: user.email, user_id: user.id }, status: :created
        else
          render json: {}, status: :unauthorized
        end
    end
end
