module Api
  module V1
    class MenuCategoriesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @menu_categories = MenuCategory.all
        render json: @menu_categories
      end

      def show
        @menu_category = Menu.find(params[:menu_id]).categories
        render json: @menu_category, status: :ok
      end
    end
  end
end
