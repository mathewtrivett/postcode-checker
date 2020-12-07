# frozen_string_literal: true

RSpec.shared_examples 'Eligibility failure' do
  it { is_expected.to have_content I18n.t('activemodel.errors.messages.not_in_service') }
  it { is_expected.to have_selector 'form[action=\'/eligibility_checks\'][method=post]' }
  it { is_expected.to have_field I18n.t('helpers.label.eligibility_check.postcode'), type: :text }
  it { is_expected.to have_button I18n.t('helpers.submit.eligibility_check.create') }
end
