module Api
  module V1
    class CategoriesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @categories = Category.all
        render json: @categories, status: :ok
      end

      def show
        @category = Category.find(params[:id])
        render json: @category, status: :ok
      end

      def create
        @category = Category.create!(category_params)
        render json: @category, status: :created
      end

      def update
        @category = Category.find(params[:id])
        @category.update(category_params)
        head :no_content
      end

      def destroy
        @category = Category.find(params[:id])
        @category.destroy
        head :no_content
      end

      private

      def category_params
        params.permit(:name)
      end
    end
  end
end
