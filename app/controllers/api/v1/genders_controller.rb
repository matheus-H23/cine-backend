module Api
  module V1
    class GendersController < Api::V1::CrudController
      
        before_action :set_gender, only: %i[update edit destroy]

        def index
          @genders = Gender.all
          render :index
        end
            
        def create
          @gender = Gender.new(gender_params)
          if @gender.save
            render :show
          else
            render json: {status: "error", error: @gender.errors.messages}, status: 401
          end
        end
      
        def update
          if @gender.update(gender_params)
            render :show
          else
            render json: {status: "error", message: "Error updating gender, try again later"}
          end
        end
      
        def destroy
          if @gender.destroy
            render json: {status: "success", message: "Gender removed successfully"}, status: 200
          else
            render json: {status: "error", message: "Error destroying gender, try again later", error: @gender.errors.messages}, status: 500
          end
        end

        private

        def set_gender
          @gender = Gender.find(params[:id])
        end

        def gender_params
          params.permit(:name)
        end
    end
  end
end