# frozen_string_literal: true

RSpec.shared_examples 'Eligibility success' do
  it { is_expected.to have_content I18n.t('screens.eligibility_success.title') }
  it { is_expected.to have_content I18n.t('screens.eligibility_success.message') }
  it { is_expected.to have_current_path success_eligibility_checks_path }
end
