# frozen_string_literal: true

FactoryBot.define do
  factory :allowed_post_code do
    postcode { 'MyString' }
    service_area { nil }
  end
end
