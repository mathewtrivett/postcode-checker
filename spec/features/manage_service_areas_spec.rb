# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Manage service areas', type: :feature do
  subject { page }

  describe 'access the service area form' do
    before do
      visit admin_service_areas_path
      click_on 'New service area'
    end

    it { is_expected.to have_current_path new_admin_service_area_path }
    it { is_expected.to have_selector 'form[action=\'/admin/service_areas\'][method=post]' }
  end

  describe 'add a new service area' do
    before do
      visit new_admin_service_area_path
      fill_in 'Name', with: 'My service area'
      click_on 'Create Service area'
    end

    let(:service_area_id) { ServiceArea.last.id }

    it { is_expected.to have_current_path admin_service_area_path service_area_id }
    it { is_expected.to have_content 'My service area' }
  end

  describe 'edit a service area' do
    let(:service_area) { create(:service_area) }

    before do
      visit edit_admin_service_area_path service_area.id
      fill_in 'Name', with: 'Tower Hamlets'
      click_on 'Update Service area'
    end

    it { is_expected.to have_current_path admin_service_area_path service_area.id }
    it { is_expected.to have_content 'Tower Hamlets' }
  end
end
