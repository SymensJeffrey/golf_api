class ApplicationController < ActionController::Base
    def current_user
        auth_headers = request.headers["Authorization"]
        if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
          token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
          begin
            decoded_token = JWT.decode(
              token,
              Rails.application.credentials.fetch(f149685438a59b95d407399e11b20c2311052231acdc95e5045217588a8b2ab405e34cba1bf5789c7f3681568cd93b315887ed80c4079e5233f2ff222b4c2b2a),
              true,
              { algorithm: "HS256" }
            )
            User.find_by(id: decoded_token[0]["user_id"])
          rescue JWT::ExpiredSignature
            nil
          end
        end
      end
    
      def authenticate_user
        unless current_user
          render json: {}, status: :unauthorized
        end
    end
end
