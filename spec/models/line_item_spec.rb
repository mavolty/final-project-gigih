require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'validations' do
    describe '#menu_id' do
      it { should validate_presence_of(:menu_id) }
    end

    describe '#order_id' do
      it { should validate_presence_of(:order_id) }
    end

    describe '#quantity' do
      it { should validate_presence_of(:quantity) } 
    end
  end
end
