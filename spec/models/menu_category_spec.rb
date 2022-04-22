require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  describe 'associations' do
    it { should belong_to(:menu) }
    it { should belong_to(:category) }
  end
end
