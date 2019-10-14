class UsersController < ApplicationController

    before_action :authorize!, only: [:update, :destroy]

    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def show
        @user = User.find_by(params[:id])
        if @user
            render json: @user, status: :ok
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :ok
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find_by(current_user.id)
        if @user
            @user = user_params
            if @user.save
                render json: @user, status: :ok
            end
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :password, :age, :fewest_misses, :best_combo, :games_played, :id)
    end
    
end
