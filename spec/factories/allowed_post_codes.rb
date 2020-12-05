# frozen_string_literal: true

FactoryBot.define do
  factory :allowed_post_code do
    postcode { 'MyString' }
    service_area { nil }

    factory :southwark_post_code do
      postcode { 'SE17QD' }
      service_area factory: :southwark_service_area
    end

    factory :lambeth_post_code do
      postcode { 'SE17QA' }
      service_area factory: :lambeth_service_area
    end

    factory :invalid_postcode do
      postcode { 42 }
      service_area { nil }
    end

    factory :unsupported_postcode do
      postcode { 'NG13AL' }
      service_area { nil }
    end
  end
end
