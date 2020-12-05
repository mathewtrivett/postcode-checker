# frozen_string_literal: true

require 'rails_helper'
require 'net/http'

RSpec.describe AllowedPostCodeValidator do
  let(:address) { 'https:'}

  describe '#client' do
    subject { described_class.client }
    it { is_expected.to be_a Net::HTTP }
    subject { described_class.client.address }
    it { is_expected.to eq ENV['POSTCODE_VALIDATION_SERVICE_URI'] }
  end
end