# frozen_string_literal: true

RSpec.shared_examples 'PostCodeFormattable' do
  describe 'hooks' do
    describe 'before_validation' do
      let(:expected_postcode) { 'SH241AA' }
      let(:model) { described_class.name.underscore.downcase.to_sym }

      before { subject.valid? }

      context 'with a lowercase postcode' do
        subject { build(model, postcode: 'sh24 1aa') }

        its(:postcode) { is_expected.to eq expected_postcode }
      end

      context 'with a upper case postcode' do
        subject { build(model, postcode: 'SH24 1Aa') }

        its(:postcode) { is_expected.to eq expected_postcode }
      end

      context 'with a mixed case postcode' do
        subject { build(model, postcode: 'SH24 1AA') }

        its(:postcode) { is_expected.to eq expected_postcode }
      end
    end
  end
end
