require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    describe '#name' do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_most(50) }
      it { should validate_length_of(:name).is_at_least(3) }
      it { should validate_uniqueness_of(:name) }
    end
  end
end
