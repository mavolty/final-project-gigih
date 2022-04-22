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

    context 'when the record does not exist' do
      let(:customer_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find/)
      end
    end
  end

  describe 'POST /api/v1/line_items' do
    let(:valid_attributes) { { order_id: 1, menu_id: 1, quantity: 1 } }

    context 'when the request is valid' do
      before { post '/api/v1/line_items', params: valid_attributes }

      it 'creates a line_item' do
        expect(json['quantity']).to eq(1)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end


    context 'when the request is invalid' do
      before { post '/api/v1/line_items', params: { order_id: 1 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /api/v1/line_items/:id' do
    let(:valid_attributes) { { quantity: 2 } }

    context 'when the record exists' do
      before { put "/api/v1/line_items/#{line_item_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
