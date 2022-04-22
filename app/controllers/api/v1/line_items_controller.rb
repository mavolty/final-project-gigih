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
    end
  end
end
