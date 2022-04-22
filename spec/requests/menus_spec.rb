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
  end
end
