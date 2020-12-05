# frozen_string_literal: true

require 'rails_helper'
require 'net/http'

RSpec.describe AllowedPostCodeValidator do
  subject { described_class }
  let(:postcode) { 'SE1 7QD' }
  it { is_expected.to be < ActiveModel::EachValidator }

  describe '.client' do
    subject { described_class.client }
    it { is_expected.to be_a Net::HTTP }
  end

  describe '.get_postcode' do
    subject do
      VCR.use_cassette('postcodes/SE17QD') do
        described_class.get_postcode postcode
      end
    end

    it { is_expected.to be_a Net::HTTPResponse }
  end
end