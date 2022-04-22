module Api
  module V1
    class LineItemsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @line_items = LineItem.all
        @line_items = @line_items.map do |line_item|
          {
            id: line_item.id,
            order_id: line_item.order_id,
            menu_id: line_item.menu_id,
            quantity: line_item.quantity,
            total_price: line_item.total_price,
            created_at: line_item.created_at,
            updated_at: line_item.updated_at
          }
        end

        render json: @line_items, status: :ok
      end

      def show
        @customer = Customer.find(params[:customer_id])
        @line_items = LineItem.where(order_id: @customer.order_ids)
        @line_items = @line_items.map do |line_item|
          {
            id: line_item.id,
            order_id: line_item.order_id,
            menu_id: line_item.menu_id,
            quantity: line_item.quantity,
            total_price: line_item.total_price,
            created_at: line_item.created_at,
            updated_at: line_item.updated_at
          }
        end

        render json: @line_items, status: :ok
      end

      def create
        @line_item = LineItem.create!(line_item_params)
        render json: @line_item, status: :created
      end

      def update
        @line_item = LineItem.find(params[:id])
        @line_item.update(line_item_params)
        head :no_content
      end

      def destroy
        @line_item = LineItem.find(params[:id])
        @line_item.destroy
        head :no_content
      end

      private

      def line_item_params
        params.permit(:order_id, :menu_id, :quantity)
      end
    end
  end
end
