module Api
  module V1
    class ReportsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @orders = Order.all
        @line_items = LineItem.all
        @customers = Customer.all
        @menus = Menu.all

        @report = []
        @line_items.each do |line_item|
          if line_item.order.order_date.to_date == Date.today
            @report << {
              email: @customers.find(line_item.order.customer_id).email,
              menu: @menus.find(line_item.menu_id).name,
              quantity: line_item.quantity,
              total_price: @menus.find(line_item.menu_id).price * line_item.quantity,
              order_date: line_item.order.order_date
            }
          end
        end

        render json: @report, status: :ok
      end
    end
  end
end
