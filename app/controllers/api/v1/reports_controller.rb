module Api
  module V1
    class ReportsController < ApplicationController
      skip_before_action :verify_authenticity_token
    end
  end
end
