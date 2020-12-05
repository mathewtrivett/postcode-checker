class AllowedPostCode < ApplicationRecord
  validates :postcode, presence: true
  belongs_to :service_area, optional: true
end
