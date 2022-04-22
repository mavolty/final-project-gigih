require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:menu_id) }
    it { should validate_presence_of(:order_id) }
  end
end
