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
            Rails.application.credentials.fetch(de2139e6ee20cd397f8306bcf0fc2d9bfdcb1aa0342b78cc917118ddb16dfac0542b99dbb074aaeb7059485c28d570bbe13f72e96642e4ad77f81fa3d0822b8f), # the secret key
            "HS256" # the encryption algorithm
          )
          render json: { jwt: jwt, email: user.email, user_id: user.id }, status: :created
        else
          render json: {}, status: :unauthorized
        end
    end
end
