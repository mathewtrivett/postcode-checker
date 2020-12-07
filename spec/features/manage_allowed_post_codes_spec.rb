# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Manage allowed postcodes', type: :feature do
  subject { page }

  describe 'access the allowed post codes form' do
    before do
      visit admin_allowed_post_codes_path
      click_on 'New allowed post code'
    end

    it { is_expected.to have_current_path new_admin_allowed_post_code_path }
    it { is_expected.to have_selector 'form[action=\'/admin/allowed_post_codes\'][method=post]' }
  end

  describe 'add a new allowed post code' do
    before do
      visit new_admin_allowed_post_code_path
      fill_in 'Postcode', with: 'NG1 3AL'
      click_on 'Create Allowed post code'
    end

    let(:postcode) { AllowedPostCode.last }

    it { is_expected.to have_current_path admin_allowed_post_code_path postcode.id }
    it { is_expected.to have_content 'NG13AL' }
  end

  describe 'edit an allowed post code' do
    let(:postcode) { create(:allowed_post_code) }

    before do
      visit edit_admin_allowed_post_code_path postcode.id
      fill_in 'Postcode', with: 'NG1 3AL'
      click_on 'Update Allowed post code'
    end

    it { is_expected.to have_current_path admin_allowed_post_code_path postcode.id }
    it { is_expected.to have_content 'NG13AL' }
  end
end
