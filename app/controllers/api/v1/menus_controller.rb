module Api
  module V1
    class MenusController < ApplicationController
      def index
        @menus = Menu.all
        render json: @menus, status: :ok
      end
    end
  end
end
