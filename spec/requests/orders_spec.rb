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

  describe 'GET /api/v1/orders/:id' do
    before { get "/api/v1/orders/#{order_id}" }

    context 'when the record exists' do
      it 'returns the order' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(order_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:order_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Order/)
      end
    end
  end

  describe 'POST /api/v1/orders' do
    let(:valid_attributes) { { order_date: Date.today, status: 'new', customer_id: 1 } }

    context 'when the request is valid' do
      before { post '/api/v1/orders', params: valid_attributes }

      it 'creates a order' do
        expect(json['status']).to eq('new')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/orders', params: { order_date: nil } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Couldn't find/)
      end
    end
  end

  describe 'PUT /api/v1/orders/:id' do
    let(:valid_attributes) { { order_date: Date.today, status: 'new', customer_id: 1 } }

    context 'when the record exists' do
      before { put "/api/v1/orders/#{order_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
