require "rails_helper"

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:comments) }
  end

    describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
