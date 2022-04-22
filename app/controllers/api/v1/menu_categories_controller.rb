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

      def create
        @menu = Menu.find(params[:menu_id])
        @category = Category.find(params[:category_id])
        @menu_category = MenuCategory.new(menu: @menu, category: @category)

        if @menu_category.save
          render json: @menu_category, status: :created
        end
      end
    end
  end
end
