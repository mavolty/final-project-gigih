module Api
  module V1
    class MenusController < ApplicationController
      def index
        @menus = Menu.all
        render json: @menus, status: :ok
      end

      def show
        @menu = Menu.find(params[:id])
        render json: @menu
      end
    end
  end
end
