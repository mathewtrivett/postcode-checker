# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/eligibility_checks', type: :request do
  describe 'GET /eligibility_checks/new' do
    subject { response }
    before { get new_eligibility_check_path }
    it { is_expected.to be_successful }
    it { is_expected.to render_template 'eligibility_checks/new' }
  end
end
