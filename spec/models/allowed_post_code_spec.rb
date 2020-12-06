# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AllowedPostCode, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:postcode) }
    it { is_expected.to validate_uniqueness_of(:postcode).case_insensitive }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:service_area).optional }
  end

  describe 'indices' do
    it { is_expected.to have_db_index(:postcode) }
  end
end
