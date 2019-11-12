module Api
  module V1
    class UsersController < Api::V1::CrudController

        before_action :set_user, only: %w['show']

        def index
          @users = User.all
          render json: @users
        end
      
        def show
          render json: @user
        end
      
        # def create
        #   @ = .new(params[:])
        # end
      
        # def update
        #   @ = .find(params[:id])
        # end
      
        # def edit
        #   @ = .find(params[:id])
        # end
      
        # def destroy
        #    = .find(params[:id])
        # end

        private

        def set_user
          binding.pry
          @user = User.find(params[:id])
        end
    end
  end
end