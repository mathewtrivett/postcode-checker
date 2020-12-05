# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'eligibility_checks/new.html.erb', type: :view do
  subject { rendered }

  before do
    assign :eligibility_check, build(:eligibility_check)
    render
  end

  it { is_expected.to have_selector 'form[action=\'/eligibility_checks\'][method=post]' }
  it { is_expected.to have_field I18n.t('helpers.label.eligibility_check.postcode'), type: :text }
  it { is_expected.to have_button I18n.t('helpers.submit.eligibility_check.create') }
end
