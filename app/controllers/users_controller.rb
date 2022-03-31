class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        users = User.all 
        render json: users.as_json
    end

    def create
        user = User.new(
          name: params[:name],
          email: params[:email].downcase,
          password: params[:password],
          password_confirmation: params[:password_confirmation],
          role: "user"
        )
        if user.save
          render json: { message: "User created successfully" }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :bad_request
        end
    end

    def show
        user = current_user
        render json: user
    end
    
    def update
      user = User.find_by(id:params[:id])
      user.role = params[:role] || user.role
      user.email = params[:email] || user.email
      user.name = params[:name] || user.name
      user.save
      render json: user.as_json
    end
end
