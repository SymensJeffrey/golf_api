class TournamentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        tournament = Tournament.new(
            status: "active"
        )
        if tournament.save
            render json: { message: "Tournament created" }, status: :created
        else
            render json: { errors: tournament.errors.full_messages }, status: :bad_request
        end
    end
end
