# frozen_string_literal: true

class AllowedPostCode < ApplicationRecord
  include PostCodeFormattable
  validates :postcode, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :service_area, optional: true
end
