module Api
  module V1
    class UsersController < Api::V1::CrudController

        before_action :set_user, only: %i[show update]

        def index
          @users = User.all
          render json: @users
        end
      
        def show
          render json: @user
        end
      
        def create
          @user = User.new(user_params)
          if @user.save
            render json: @user
          else
            render json: {status: "error", error: @user.errors.messages}, status: 401
          end
        end
      
        def update
          binding.pry
          if @user.update(user_params)
            render json: @user
          else
            render json: {status: "error", message: "Error updating user, try again later", error: @user.errors.messages}, status: 500
          end
        end
      
        # def edit
        #   @ = .find(params[:id])
        # end
      
        # def destroy
        #    = .find(params[:id])
        # end

        private

        def set_user
          @user = User.find(params[:id])
        end

        def user_params
          params.permit(:email, :firstname, :lastname, :password, :birthdate)
        end
    end
  end
end