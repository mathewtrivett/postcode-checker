# frozen_string_literal: true

FactoryBot.define do
  factory :service_area do
    name { 'MyString' }

    factory :southwark_service_area do
      name { 'Southwark' }
    end

    factory :lambeth_service_area do
      name { 'Lambeth' }
    end
  end
end
