# frozen_string_literal: true

# Handles eligibility check requests
class EligibilityChecksController < ApplicationController
  def new
    @eligibility_check = EligibilityCheck.new
  end

  def create
    @eligibility_check = EligibilityCheck.new eligibility_params
    respond_to do |format|
      if @eligibility_check.valid?
        format.html { redirect_to success_eligibility_checks_path }
      else
        format.html { render :new }
      end
    end
  end

  def success; end

  private

  def eligibility_params
    params.fetch(:eligibility_check, {}).permit(:postcode)
  end
end
