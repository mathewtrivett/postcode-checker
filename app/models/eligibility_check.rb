# frozen_string_literal: true

class EligibilityCheck
  include ActiveModel::Model
  attr_accessor :postcode

  validates :postcode, presence: true
end
