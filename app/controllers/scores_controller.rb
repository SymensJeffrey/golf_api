class ScoresController < ApplicationController
    
    def index
        if current_user
            scores = Score.where(status: "active")
            render json: scores.as_json
        else
            render json: [], status: :unauthorized
        end
    end
end
