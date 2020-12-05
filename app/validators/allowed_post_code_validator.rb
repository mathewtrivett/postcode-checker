# frozen_string_literal: true

require 'net/http'

# Custom Validator to validate allowed postcodes
class AllowedPostCodeValidator < ActiveModel::EachValidator
  # Creates a simple client to query the postcode service
  # @return [Net::HTTP] A client configured for the postcode service
  def self.client
    Net::HTTP.new ENV['POSTCODE_VALIDATION_SERVICE_URI']
  end

  # Queries postcode validation service with a postcode
  # @param value [String] The postcode being validated
  # @return [ActiveSupport::HashWithIndifferentAccess] The response from the postcode service
  def self.get_postcode(value)
    response = client.get("/postcodes/#{value}")
    json = JSON.parse response.body
    ActiveSupport::HashWithIndifferentAccess.new json
  end

  # Fetches postcode data from the cache or calls get_postcode on a cache miss
  # @param value [String] The postcode being validated
  # @return [ActiveSupport::HashWithIndifferentAccess] The response from the postcode service
  def self.fetch_postcode(value)
    Rails.cache.fetch("postcodes/#{value}") do
      get_postcode value
    end
  end
end
