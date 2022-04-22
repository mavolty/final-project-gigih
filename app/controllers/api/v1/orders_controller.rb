module Api
  module V1
    class OrdersController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @orders = Order.all
        render json: @orders, status: :ok
      end

      def show
        @order = Order.find(params[:id])
        render json: @order, status: :ok
      end

      def create
        @order = Order.new(order_params) 
        @order.customer = Customer.find(params[:customer_id])

        if @order.save
          render json: @order, status: :created
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        head :no_content
      end
    end
  end
end
