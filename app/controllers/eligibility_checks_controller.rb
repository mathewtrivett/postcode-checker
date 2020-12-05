# frozen_string_literal: true

# Handles eligibility check requests
class EligibilityChecksController < ApplicationController
  def new
    @eligibility_check = EligibilityCheck.new
  end

  def create
    @eligibility_check = EligibilityCheck.new eligibility_params
    if @eligibility_check.valid?
      redirect_to success_eligibility_checks_path
    else
      render :new
    end
  end

  def success; end

  private

  def eligibility_params
    params.fetch(:eligibility_check, {}).permit(:postcode)
  end
end
