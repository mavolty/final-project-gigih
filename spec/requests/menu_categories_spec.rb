require 'rails_helper'

RSpec.describe "MenuCategories", type: :request do
  let!(:menu_category) { create(:menu_category) }
  let(:menu_id) { menu_category.menu.id }
  let(:category_id) { menu_category.category.id }

  describe 'GET /api/v1/menu_categories' do
    before { get '/api/v1/menu_categories' }

    it 'returns menu_categories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/menu_categories/:menu_id' do
    before { get "/api/v1/menu_categories/#{menu_id}" }

    context 'when the record exists' do
      it 'returns the menu_category' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(menu_category.id)
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
        expect(response.body).to match(/Couldn't find MenuCategory/)
      end
    end
  end

  describe 'POST /api/v1/menu_categories' do
    let(:valid_attributes) { { menu_id: menu_id, category_id: category_id } }

    context 'when the request is valid' do
      before { post '/api/v1/menu_categories', params: valid_attributes }

      it 'creates a menu_category' do
        expect(json['menu_id']).to eq(menu_id)
        expect(json['category_id']).to eq(category_id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/menu_categories', params: { menu_id: menu_id, category_id: 'invalid-id' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end
 end
