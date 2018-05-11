require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'Associations' do
    it 'belongs_to category' do
      association = described_class.reflect_on_association(:category).macro
      expect(association).to eq :belongs_to
    end
    it { should have_many(:answers) }
    it { should have_many(:users).through(:answers) }
  end
end