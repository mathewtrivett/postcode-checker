# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/eligibility_checks', type: :request do
  subject { response }

  let(:valid_params) { attributes_for(:eligibility_check) }
  let(:invalid_params) { attributes_for(:eligibility_check, postcode: nil) }

  describe 'GET /eligibility_checks/new' do
    before { get new_eligibility_check_path }

    it { is_expected.to be_successful }
    it { is_expected.to render_template 'eligibility_checks/new' }
  end

  describe 'GET eligibility_checks/show' do
    before { get success_eligibility_checks_path }

    it { is_expected.to be_successful }
    it { is_expected.to render_template 'eligibility_checks/success' }
  end

  describe 'POST /eligibility_checks' do
    context 'with valid parameters' do
      before do
        create(:southwark_service_area)
        VCR.use_cassette('postcodes/southwark_postcode') do
          post eligibility_checks_path, params: { eligibility_check: valid_params }
        end
      end

      it { is_expected.to redirect_to success_eligibility_checks_path }
    end

    context 'with invalid parameters' do
      before { post eligibility_checks_path, params: { eligibility_check: invalid_params } }

      it { is_expected.to render_template 'eligibility_checks/new' }
    end
  end
end
