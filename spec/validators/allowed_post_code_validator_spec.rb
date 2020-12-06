# frozen_string_literal: true

require 'rails_helper'
require 'net/http'

RSpec.describe AllowedPostCodeValidator, type: :model do
  let(:postcode_service) { ENV['POSTCODE_VALIDATION_SERVICE_URI'] }

  before do
    create(:southwark_service_area)
    create(:lambeth_service_area)
    create(:sh24_1aa_postcode)
    create(:sh24_1ab_postcode)
  end

  describe '.validate' do
    with_model :ObjectWithPostCode do
      model do
        attr_accessor :postcode

        validates :postcode, allowed_post_code: true
      end
    end

    subject(:model) { ObjectWithPostCode.new }

    context 'with valid postcode' do
      it {
        VCR.use_cassette('postcodes/southwark_postcode') do
          expect(model).to allow_value(build(:southwark_post_code).postcode).for(:postcode)
        end
      }

      it {
        VCR.use_cassette('postcodes/lambeth_postcode') do
          expect(model).to allow_value(build(:lambeth_post_code).postcode).for(:postcode)
        end
      }

      it {
        VCR.use_cassette('postcodes/sh24_1aa') do
          expect(model).to allow_value(build(:sh24_1aa_postcode).postcode).for(:postcode)
        end
      }

      it {
        VCR.use_cassette('postcodes/sh24_1ab') do
          expect(model).to allow_value(build(:sh24_1ab_postcode).postcode).for(:postcode)
        end
      }
    end

    context 'with invalid postcode' do
      it {
        VCR.use_cassette('postcodes/nil_postcode') do
          expect(model).not_to allow_value(nil).for(:postcode)
        end
      }

      it {
        VCR.use_cassette('postcodes/invalid_postcode') do
          expect(model).not_to allow_value(build(:invalid_postcode).postcode).for(:postcode)
        end
      }

      it {
        VCR.use_cassette('postcodes/unsupported_postcode') do
          expect(model).not_to allow_value(build(:unsupported_postcode).postcode).for(:postcode)
        end
      }
    end
  end

  describe '.client' do
    subject { described_class.client }

    it { is_expected.to be_a Net::HTTP }
    its(:address) { is_expected.to eq postcode_service }
  end

  describe '.get_postcode' do
    context 'with valid postcode' do
      subject do
        VCR.use_cassette('postcodes/southwark_postcode') do
          described_class.get_postcode(build(:southwark_post_code).postcode)
        end
      end

      it { is_expected.to be_an ActiveSupport::HashWithIndifferentAccess }
      it { is_expected.to include status: 200 }
    end

    context 'with invalid postcode' do
      subject do
        VCR.use_cassette('postcodes/invalid_with_number') do
          described_class.get_postcode(build(:invalid_postcode).postcode)
        end
      end

      it { is_expected.to be_an ActiveSupport::HashWithIndifferentAccess }
      it { is_expected.to include status: 404 }
      it { is_expected.to include error: 'Invalid postcode' }
    end
  end

  describe '.fetch_postcode' do
    subject(:fetch_postcode) do
      VCR.use_cassette('postcodes/southwark_postcode') do
        described_class.fetch_postcode(build(:southwark_post_code).postcode)
      end
    end

    let(:request_uri) { "https://#{postcode_service}/postcodes/#{build(:southwark_post_code).postcode}" }
    let(:southwark_cache_key) { "postcodes/#{build(:southwark_post_code).postcode}" }

    context 'without a cached value' do
      before { Rails.cache.clear }

      it { is_expected.to be_an ActiveSupport::HashWithIndifferentAccess }
      it { expect(a_request(:get, request_uri)).to have_been_made.at_most_once }

      it do
        fetch_postcode
        expect(Rails.cache.read(southwark_cache_key)).not_to be_nil
      end
    end

    context 'with a cached value' do
      before { Rails.cache.write(southwark_cache_key, fetch_postcode) }

      it { is_expected.to be_an ActiveSupport::HashWithIndifferentAccess }
      it { expect(a_request(:get, request_uri)).not_to have_been_made }
    end
  end
end
