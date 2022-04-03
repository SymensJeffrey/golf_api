class CoursesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        courses = Course.all 
        render json: courses.as_json
    end

    def create
        course = Course.new(
            hole1_par: params[:hole1_par],
            hole2_par: params[:hole2_par],
            hole3_par: params[:hole3_par],
            hole4_par: params[:hole4_par],
            hole5_par: params[:hole5_par],
            hole6_par: params[:hole6_par],
            hole7_par: params[:hole7_par],
            hole8_par: params[:hole8_par],
            hole9_par: params[:hole9_par],
            front_par: params[:front_par],
            hole10_par: params[:hole10_par],
            hole11_par: params[:hole11_par],
            hole12_par: params[:hole12_par],
            hole13_par: params[:hole13_par],
            hole14_par: params[:hole14_par],
            hole15_par: params[:hole15_par],
            hole16_par: params[:hole16_par],
            hole17_par: params[:hole17_par],
            hole18_par: params[:hole18_par],
            back_par: params[:back_par],
            total_par: params[:total_par],
            city: params[:city],
            name: params[:name],
        )
        if course.save
            render json: { message: "Course created" }, status: :created
        else
            render json: { errors: course.errors.full_messages }, status: :bad_request
        end
    end

    def show
        course = Course.find_by(id: params[:id])
        render json: course.as_json
    end
end
