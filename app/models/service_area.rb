# frozen_string_literal: true

class ServiceArea < ApplicationRecord
  validates :name, presence: true
  has_many :allowed_post_codes, dependent: :destroy
  accepts_nested_attributes_for :allowed_post_codes
end
