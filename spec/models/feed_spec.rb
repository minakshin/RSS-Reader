require 'rails_helper'

RSpec.describe Feed, type: :model do
  context 'Associations' do
    it { should have_many(:entries) }
    it { is_expected.to have_many(:entries) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:name) }
    it 'should validate uniqueness of url' do
      valid_feed = FactoryGirl.create(:feed)
      invalid_feed = FactoryGirl.build(:feed)
      expect { invalid_feed.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
end
