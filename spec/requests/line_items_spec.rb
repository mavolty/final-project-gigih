require 'rails_helper'

RSpec.describe 'LineItems', type: :request do
  let!(:line_items) { create_list(:line_item, 10) }
  let(:line_item_id) { line_items.first.id }

  describe 'GET /api/v1/line_items' do
    before { get '/api/v1/line_items' }

    it 'returns line_items' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/line_items/:customer_id' do
    let(:customer_id) { line_items.first.order.customer_id }
    before { get "/api/v1/line_items/#{customer_id}" }

    context 'when the record exists' do
      it 'returns the line_item' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
