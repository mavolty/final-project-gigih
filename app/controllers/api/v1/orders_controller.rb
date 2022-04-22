module Api
  module V1
    class OrdersController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @orders = Order.all
        render json: @orders, status: :ok
      end
    end
  end
end
