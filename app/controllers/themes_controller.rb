class ThemesController < ApplicationController
    def show
        @themes = Theme.where(name: params[:id])
        render json: @themes, status: :ok
    end
end
