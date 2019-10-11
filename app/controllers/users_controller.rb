class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # Stat.all.each {|s| @user.user_stats.build(stat_id: s.id) }
            @stats = Stat.all
            @stats.each do |stat|
                @new_stat = UserStat.create!(user_id: @user.id, stat_id: stat.id, stat_name: stat.stat_name, score: 0)
            end
            render json: @user.to_json(include: :user_stats), status: :ok
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :password_digest, :age)
    end
    
end
