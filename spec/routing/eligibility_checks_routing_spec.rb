# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EligibilityChecksController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/eligibility_checks/new').to route_to('eligibility_checks#new')
    end

    it 'routes to #create' do
      expect(post: '/eligibility_checks').to route_to('eligibility_checks#create')
    end
  end
end
