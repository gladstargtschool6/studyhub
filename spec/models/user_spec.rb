require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Associations' do
    it { should have_many(:answers) }
    it { should have_many(:questions).through(:answers) }
    it { should have_many(:categories) }
  end
end