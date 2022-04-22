require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  describe 'GET /api/v1/reports' do
    before { get '/api/v1/reports' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
