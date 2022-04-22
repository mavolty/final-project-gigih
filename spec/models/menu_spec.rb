require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'validations' do
    describe '#name' do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_most(100) }
      it { should validate_length_of(:name).is_at_least(3) }
      it { should validate_uniqueness_of(:name) }
    end

    describe '#description' do
      it { should validate_length_of(:description).is_at_most(150) }
    end

    describe '#price' do
      it { should validate_presence_of(:price) }
      it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
    end
  end

  describe 'associations' do
    it { should have_many(:menu_categories).dependent(:destroy) }
    it { should have_many(:categories).through(:menu_categories) }
  end
end
