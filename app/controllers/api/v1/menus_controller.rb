module Api
  module V1
    class MenusController < ApplicationController
      def index
        @menus = Menu.all
        render json: @menus, status: :ok
      end

      def show
        @menu = Menu.find(params[:id])
        render json: @menu, status: :ok
      end

      def create
        @menu = Menu.new(menu_params)
        if @menu.save
          render json: @menu, status: :created
        else
          render json: @menu.errors, status: :unprocessable_entity
        end
      end

      def update
        @menu = Menu.find(params[:id])
        @menu.update(menu_params)
      end

      private

      def menu_params
        params.permit(:name, :description, :price)
      end
    end
  end
end
