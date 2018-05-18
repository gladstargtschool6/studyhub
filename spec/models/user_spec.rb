require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Associations' do
    it { should have_many(:answers) }
    it { should have_many(:questions).through(:answers) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:name) }
    it { should accept_nested_attributes_for(:questions) }
  end
end