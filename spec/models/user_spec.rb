require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  describe 'Factory' do
    it 'has a valid factory' do
      expect(subject).to be_valid
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
  
end