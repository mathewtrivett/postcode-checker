# frozen_string_literal: true

# Handles eligibility check requests
class EligibilityChecksController < ApplicationController
  def new
    @eligibility_check = EligibilityCheck.new
  end

  def create; end
end
