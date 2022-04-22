module Api
  module V1
    class MenusController < ApplicationController
      def index
        @menus = Menu.all
        render json: @menus
      end
    end
  end
end
