class ScoresController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        if current_user
            scores = Score.where(status: "active")
            render json: scores.as_json
        else
            render json: [], status: :unauthorized
        end
    end
    def show
        score = Score.find_by(id: params[:id])
        render json: score.as_json
    end
    def create
        score = Score.new(
            user_id:current_user.id,
            status: "active",
            hole1: 0,
            hole2: 0,
            hole3: 0,
            hole4: 0,
            hole5: 0,
            hole6: 0,
            hole7: 0,
            hole8: 0,
            hole9: 0,
            front: 0,
            hole10: 0,
            hole11: 0,
            hole12: 0,
            hole13: 0,
            hole14: 0,
            hole15: 0,
            hole16: 0,
            hole17: 0,
            hole18: 0,
            back: 0,
            total: 0,
            tournament_id: 0
        )
        if score.save
            render json: { message: "Score added to workout" }, status: :created
        else
            render json: { errors: score.errors.full_messages }, status: :bad_request
        end
    end
end
