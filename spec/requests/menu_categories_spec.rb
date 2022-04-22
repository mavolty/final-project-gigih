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
        expect(response.body).to match(/Couldn't find/)
      end
    end
  end

  describe 'POST /api/v1/menu_categories' do
    let(:menu_id_new) { create(:menu).id }
    let(:category_id_new) { create(:category).id }

    let(:valid_attributes) { { menu_id: menu_id_new, category_id: category_id_new } }

    context 'when the request is valid' do
      before { post '/api/v1/menu_categories', params: valid_attributes }

      it 'creates a menu_category' do
        expect(json['menu_id']).to eq(menu_id_new)
        expect(json['category_id']).to eq(category_id_new)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/menu_categories', params: { menu_id: menu_id, category_id: 'invalid-id' } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Couldn't find/)
      end
    end
  end

  describe 'PUT /api/v1/menu_categories/:menu_id' do
    let(:valid_attributes) { { menu_id: menu_id, category_id: category_id } }

    context 'when the record exists' do
      before { put "/api/v1/menu_categories/#{menu_category.id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/menu_categories/:id' do
    before { delete "/api/v1/menu_categories/#{menu_category.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
 end
