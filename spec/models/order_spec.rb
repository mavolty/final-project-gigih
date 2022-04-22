require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    describe '#order_date' do
      it { should validate_presence_of(:order_date) }
    end

    describe '#customer_id' do
      it { should validate_presence_of(:customer_id) }
    end

    describe '#status' do
      it { should validate_presence_of(:status) }
      it { should validate_inclusion_of(:status).in_array(%w(new paid cancelled)) }
    end
  end
end
