module Api
  module V1
    class MoviesController < Api::V1::CrudController

        before_action :set_movie, only: %i[show update destroy]

        def index
          @movies_tot = Movie.all.count
          @movies = Movie.all.page(params[:page]).per(15).includes(:gender)
          render :index 
        end
      
        def show
          render :show
        end
      
        def create
          @movie = Movie.new(movie_params)
          if @movie.save
            render :show
          else
            render json: {status: "error", error: @movie.errors.messages}, status: 401
          end
        end
      
        def update
          if @movie.update(movie_params)
            render json: @movie
          else
            render json: {status: "error", message: "Error updating movie, try again later"}
          end
        end
      
        def destroy
          if @movie.destroy
            render json: {status: "success", message: "Movie removed successfully"}, status: 200
          else
            render json: {status: "error", message: "Error destroying movie, try again later", error: @movie.errors.messages}, status: 500
          end
        end

        private

        def set_movie
          @movie = Movie.find(params[:id])
        end

        def movie_params
          params.permit(:title, :release_date, :actors, :directors, :gender, :original_language, :duration)
        end
    end
  end
end