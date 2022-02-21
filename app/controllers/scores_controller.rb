class ScoresController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        if current_user
            scores = Score.where(status: "active", user_id: current_user.id)
            render json: scores.reverse_order
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
            token: params[:token],
            name: params[:name],
            tournament_id: Tournament.find_by(token: params[:token]).id
        )
        if score.save
            render json: { message: "Score created" }, status: :created
        else
            render json: { errors: score.errors.full_messages }, status: :bad_request
        end
    end
    def update
        score = Score.find_by(id:params[:id])
        score.hole1 = params[:hole1] || score.hole1
        score.hole2 = params[:hole2] || score.hole2
        score.hole3 = params[:hole3] || score.hole3
        score.hole4 = params[:hole4] || score.hole4
        score.hole5 = params[:hole5] || score.hole5
        score.hole6 = params[:hole6] || score.hole6
        score.hole7 = params[:hole7] || score.hole7
        score.hole8 = params[:hole8] || score.hole8
        score.hole9 = params[:hole9] || score.hole9
        score.front = score.hole1 + score.hole2 + score.hole3 + score.hole4 + score.hole5 + score.hole6 + score.hole7 + score.hole8 + score.hole9
        score.hole10 = params[:hole10] || score.hole10
        score.hole11 = params[:hole11] || score.hole11
        score.hole12 = params[:hole12] || score.hole12
        score.hole13 = params[:hole13] || score.hole13
        score.hole14 = params[:hole14] || score.hole14
        score.hole15 = params[:hole15] || score.hole15
        score.hole16 = params[:hole16] || score.hole16
        score.hole17 = params[:hole17] || score.hole17
        score.hole18 = params[:hole18] || score.hole18
        score.back = score.hole10 + score.hole11 + score.hole12 + score.hole13 + score.hole14 + score.hole15 + score.hole16 + score.hole17 + score.hole18
        score.total = score.front + score.back
        score.status = params[:status] || score.status
        score.save
        render json: score.as_json
    end

    def destroy
        score = Score.find_by(id: params[:id])
        score.destroy
        render json: {message: "score successfully destroyed."}
    end
end
