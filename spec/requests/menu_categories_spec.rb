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
  end
 end
