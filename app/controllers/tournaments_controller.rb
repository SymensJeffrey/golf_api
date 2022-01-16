class TournamentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        tournaments = Tournament.where(status: "active", user_id: current_user.id)
        render json: tournaments
    end
    
    def show
        tournament = Tournament.find_by(id:params[:id])
        render json: tournament, include: ['scores']
    end

    def create
        tournament = Tournament.new(
            status: "active",
            token: SecureRandom.hex(3),
            user_id:current_user.id
        )
        if tournament.save
            render json: { message: "Tournament created" }, status: :created
        else
            render json: { errors: tournament.errors.full_messages }, status: :bad_request
        end
    end

    def update
        tournament = Tournament.find_by(id:params[:id])
        tournament.status = "inactive"
        tournament.save
        render json: tournament.as_json
    end
end
