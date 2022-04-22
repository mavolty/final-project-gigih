require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    describe '#order_date' do
      it { should validate_presence_of(:order_date) }
    end
  end
end
