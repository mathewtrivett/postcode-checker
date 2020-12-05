# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'eligibility_checks/success.html.erb', type: :view do
  subject { rendered }

  before { render }

  it { is_expected.to have_selector 'h1', text: I18n.t('screens.eligibility_success.title') }
  it { is_expected.to have_selector 'p', text: I18n.t('screens.eligibility_success.message') }
end
