module Api
  module V1
    class MenuCategoriesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @menu_categories = MenuCategory.all
        render json: @menu_categories
      end
    end
  end
end
