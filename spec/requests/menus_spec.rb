require 'rails_helper'

RSpec.describe 'Menus API', type: :request do
  let!(:menus) { create_list(:menu, 10) }
  let(:menu_id) { menus.first.id }

  describe 'GET /api/v1/menus' do
    before { get '/api/v1/menus' }

    it 'returns menus' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/menus/:id' do
    before { get "/api/v1/menus/#{menu_id}" }

    context 'when the record exists' do
      it 'returns the menu' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(menu_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:menu_id) { 'invalid-id' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Menu/)
      end
    end
  end

  describe 'POST /api/v1/menus' do
    let(:valid_attributes) { { name: 'My Menu', description: 'My Description', price: 5_000.0 } }

    context 'when the request is valid' do
      before { post '/api/v1/menus', params: valid_attributes }

      it 'creates a menu' do
        expect(json['name']).to eq('My Menu')
        expect(json['description']).to eq('My Description')
        expect(json['price']).to eq(5_000.0)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/menus', params: { name: nil, description: 'My Description', price: 'not a number' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
        expect(response.body).to match(/is not a number/)
      end
    end
  end
end
