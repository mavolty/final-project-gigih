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
  end
end
