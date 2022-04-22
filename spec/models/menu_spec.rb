require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'validations' do
    describe '#name' do
      it { should validate_presence_of(:name) }
    end
  end
end
