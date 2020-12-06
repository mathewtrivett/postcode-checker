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

  describe 'hooks' do
    describe 'before_validation'do
      let(:expected_postcode) { 'SH241AA' }

      context 'with a lowercase postcode' do
        subject { create(:allowed_post_code, postcode: 'sh24 1aa') }
        its(:postcode) { is_expected.to eq expected_postcode }
      end

      context 'with a upper case postcode' do
        subject { create(:allowed_post_code, postcode: 'SH24 1Aa') }
        its(:postcode) { is_expected.to eq expected_postcode }
      end

      context 'with a mixed case postcode' do
        subject { create(:allowed_post_code, postcode: 'SH24 1AA') }
        its(:postcode) { is_expected.to eq expected_postcode }
      end
    end
  end
end
