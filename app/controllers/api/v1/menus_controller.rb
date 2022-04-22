module Api
  module V1
    class MenusController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @menus = Menu.all
        render json: @menus, status: :ok
      end

      def show
        @menu = Menu.find(params[:id])
        render json: @menu, status: :ok
      end

      def create
        @menu = Menu.create!(menu_params)
        render json: @menu, status: :created
      end

      def update
        @menu = Menu.find(params[:id])
        @menu.update(menu_params)
        head :no_content
      end

      def destroy
        @menu = Menu.find(params[:id])
        @menu.destroy
        head :no_content
      end

      private

      def menu_params
        params.permit(:name, :description, :price)
      end
    end
  end
end
