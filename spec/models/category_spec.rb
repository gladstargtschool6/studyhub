require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Associations' do
    it { should have_many(:answers) }
    it { should have_many(:questions) }
    it { should validate_presence_of(:name) }

  end
end