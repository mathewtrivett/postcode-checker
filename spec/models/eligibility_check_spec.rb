# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EligibilityCheck, type: :model do
  it { is_expected.to validate_presence_of(:postcode) }
end
