require 'rails_helper'

RSpec.describe ServiceArea, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'assocations' do
    it { is_expected.to have_many(:allowed_post_codes).dependent(:destroy) }
  end

  describe 'indices' do
    it { is_expected.to have_db_index(:name) }
  end
end
