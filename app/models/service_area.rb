class ServiceArea < ApplicationRecord
  validates :name, presence: true
  has_many :allowed_post_codes, dependent: :destroy
end
