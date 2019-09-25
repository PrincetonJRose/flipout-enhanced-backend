class ThemesController < ApplicationController

    def index
        @themes = Theme.all
        render json: @themes, status: :ok
    end

    def show
        @themes = Theme.where(name: params[:id])
        render json: @themes, status: :ok
    end
    
end
