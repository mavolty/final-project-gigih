module Api
  module V1
    class CustomersController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @customers = Customer.all
        render json: @customers
      end

      def show
        @customer = Customer.find(params[:id])
        render json: @customer
      end

      def create
        @customer = Customer.create!(customer_params)
        render json: @customer, status: :created
      end

      def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)
        head :no_content
      end

      def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
        head :no_content
      end

      private

      def customer_params
        params.permit(:email)
      end
    end
  end
end

