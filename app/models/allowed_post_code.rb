# frozen_string_literal: true

class AllowedPostCode < ApplicationRecord
  validates :postcode, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :service_area, optional: true
end
