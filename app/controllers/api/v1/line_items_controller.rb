module Api
  module V1
    class LineItemsController < ApplicationController
      skip_before_action :verify_authenticity_token
    end
  end
end
