require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let!(:categories) { create_list(:category, 10) }
  let(:category_id) { categories.first.id }

  describe 'GET /api/v1/categories' do
    before { get '/api/v1/categories' }

    it 'returns categories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/categories/:id' do
    before { get "/api/v1/categories/#{category_id}" }

    context 'when the record exists' do
      it 'returns the category' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(category_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:category_id) { 'invalid-id' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Category/)
      end
    end
  end

  describe 'POST /api/v1/categories' do
    let(:valid_attributes) { { name: 'My Category' } }

    context 'when the request is valid' do
      before { post '/api/v1/categories', params: valid_attributes }

      it 'creates a category' do
        expect(json['name']).to eq('My Category')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/categories', params: { name: nil } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /api/v1/categories/:id' do
    let(:valid_attributes) { { name: 'Foobar' } }

    context 'when the record exists' do
      before { put "/api/v1/categories/#{category_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/categories/:id' do
    before { delete "/api/v1/categories/#{category_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
