# frozen_string_literal: true

FactoryBot.define do
  factory :allowed_post_code do
    postcode { 'postcode' }
    service_area { nil }

    factory :southwark_post_code do
      postcode { 'SE17QD' }
      service_area factory: :southwark_service_area
    end

    factory :lambeth_post_code do
      postcode { 'SE17QA' }
      service_area factory: :lambeth_service_area
    end

    factory :SH241AA do
      postcode { 'SH241AA' }
    end

    factory :sh24_1aa do
      postcode { 'sh24 1aa' }
    end

    factory :SH24_1Aa do
      postcode { 'SH24 1Aa' }
    end

    factory :SH24_1AA do
      postcode { 'SH24 1AA' }
    end

    factory :SH241AB do
      postcode { 'SH241AB' }
    end

    factory :invalid_postcode do
      postcode { 42 }
    end

    factory :unsupported_postcode do
      postcode { 'NG13AL' }
    end

    factory :tower_hamlets_postcode do
      postcode { 'E1 7QX' }
    end

    factory :hammersmith_and_fulham_postcode do
      postcode { 'W12 8TT' }
    end
  end
end
