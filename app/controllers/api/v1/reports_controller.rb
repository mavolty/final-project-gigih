module Api
  module V1
    class ReportsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @orders = Order.all
        @line_items = LineItem.all
        @customers = Customer.all
        @menus = Menu.all

        @reports = []

        @line_items.each do |line_item|
          if line_item.order.order_date.to_date == Date.today
            @reports << {
              email: @customers.find(line_item.order.customer_id).email,
              menu: @menus.find(line_item.menu_id).name,
              quantity: line_item.quantity,
              total_price: @menus.find(line_item.menu_id).price * line_item.quantity,
              order_date: line_item.order.order_date
            }
          end
        end

        if params[:email]
          @reports = @reports.select { |report| report[:email] == params[:email] }
        end

        if params[:total_price]
          @reports = @reports.select { |report| report[:total_price] > params[:total_price].to_f }
        end

        if params[:start_date] && params[:end_date]
          @reports = @reports.select { |report| report[:order_date] >= params[:start_date].to_date && report[:order_date] <= params[:end_date].to_date }
        end

        render json: @reports, status: :ok
      end
    end
  end
end
