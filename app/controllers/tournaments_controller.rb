class TournamentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        tournaments = Tournament.where(status: "active", user_id: current_user.id).reverse_order
        render json: tournaments.reverse_order, include: ['course']
    end
    
    def show
        tournament = Tournament.find_by(id:params[:id])
        render json: tournament, include: ['scores', 'course']
    end

    def create
        tournament = Tournament.new(
            status: "active",
            token: SecureRandom.hex(3),
            user_id:current_user.id,
            date: Time.now.strftime("%m/%d/%Y"),
            course_id: params[:course_id]
        )
        if tournament.save
            render json: tournament
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

    def destroy
        tournament = Tournament.find_by(id: params[:id])
        tournament.destroy
        render json: {message: "tournament successfully destroyed."}
    end
end
