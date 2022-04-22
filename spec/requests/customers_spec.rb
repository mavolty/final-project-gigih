require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  let!(:customers) { create_list(:customer, 10) }
  let(:customer_id) { customers.first.id }

  describe 'GET /api/v1/customers' do
    before { get '/api/v1/customers' }

    it 'returns customers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/customers/:id' do
    before { get "/api/v1/customers/#{customer_id}" }

    context 'when the record exists' do
      it 'returns the customer' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(customer_id)
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
        expect(response.body).to match(/Couldn't find Customer/)
      end
    end
  end

  describe 'POST /api/v1/customers' do
    let(:valid_attributes) { { email: Faker::Internet.email } }

    context 'when the request is valid' do
      before { post '/api/v1/customers', params: valid_attributes }

      it 'creates a customer' do
        expect(json['email']).to eq(valid_attributes[:email])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/customers', params: { email: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /api/v1/customers/:id' do
    let(:valid_attributes) { { email: Faker::Internet.email } }

    context 'when the record exists' do
      before { put "/api/v1/customers/#{customer_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/customers/:id' do
    before { delete "/api/v1/customers/#{customer_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
