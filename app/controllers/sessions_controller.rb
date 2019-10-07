class SessionsController < ApplicationController
    
    def create  
        @user = User.find_by(username: params[:username])
        if @user and @user.authenticate(params[:password])
            jwt_token = JWT.encode({ user_id: @user.id }, ENV["JWT_AUTH_KEY"], "HS256")
            render json: { jwt_user: jwt_token }, status: :ok
        else
            render json: { errors: ["Invalid email and/or password."] }, status: :unauthorized
        end
    end

end
