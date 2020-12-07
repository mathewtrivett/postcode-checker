# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CheckPostCodes', type: :feature do
  subject { page }

  before do
    create(:southwark_service_area)
    create(:lambeth_service_area)
    create(:SH241AA)
    create(:SH241AB)

    visit new_eligibility_check_path
  end

  context 'with the postcode SH24 1AA' do
    before do
      VCR.use_cassette('postcodes/SH241AA') do
        fill_in I18n.t('helpers.label.eligibility_check.postcode'), with: 'SH241AA'
        click_button I18n.t('helpers.submit.eligibility_check.create')
      end
    end

    it_behaves_like 'Eligibility success'
  end

  context 'with the postcode SH24 1AB' do
    before do
      VCR.use_cassette('postcodes/SH241AB') do
        fill_in I18n.t('helpers.label.eligibility_check.postcode'), with: 'SH241AB'
        click_button I18n.t('helpers.submit.eligibility_check.create')
      end
    end

    it_behaves_like 'Eligibility success'
  end

  context 'with the postcode SE1 7QD' do
    before do
      VCR.use_cassette('postcodes/SE17QD') do
        fill_in I18n.t('helpers.label.eligibility_check.postcode'), with: 'SE1 7QD'
        click_button I18n.t('helpers.submit.eligibility_check.create')
      end
    end

    it_behaves_like 'Eligibility success'
  end

  context 'with the postcode SE1 7QA' do
    before do
      VCR.use_cassette('postcodes/SE17QA') do
        fill_in I18n.t('helpers.label.eligibility_check.postcode'), with: 'SE1 7QA'
        click_button I18n.t('helpers.submit.eligibility_check.create')
      end
    end

    it_behaves_like 'Eligibility success'
  end

  context 'with an unsupported postcode' do
    before do
      VCR.use_cassette('postcodes/unsupported_postcode') do
        fill_in I18n.t('helpers.label.eligibility_check.postcode'), with: 'NG13AL'
        click_button I18n.t('helpers.submit.eligibility_check.create')
      end
    end

    it_behaves_like 'Eligibility failure'
  end

  context 'with NOT A POSTCODE' do
    before do
      VCR.use_cassette('postcodes/not_a_postcode') do
        fill_in I18n.t('helpers.label.eligibility_check.postcode'), with: 'NOT A POSTCODE'
        click_button I18n.t('helpers.submit.eligibility_check.create')
      end
    end

    it_behaves_like 'Eligibility failure'
  end
end
