require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let!(:orders) { create_list(:order, 10) }
  let(:order_id) { orders.first.id }

  describe 'GET /api/v1/orders' do
    before { get '/api/v1/orders' }

    it 'returns orders' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
