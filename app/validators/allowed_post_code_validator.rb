# frozen_string_literal: true

require 'net/http'

# Custom Validator to validate allowed postcodes
class AllowedPostCodeValidator < ActiveModel::EachValidator
  attr_reader :response, :value

  # Validates the arguments to check if they are an allowed postcode
  # @param record [ActiveModel|ActiveRecord]
  # @param attribute [Symbol]
  # @param value [Object]
  def validate_each(record, attribute, value)
    @value = value
    @response = AllowedPostCodeValidator.fetch_postcode(value) if @value.present?
    record.errors.add(attribute, :not_in_service) unless value.present? && valid_service_area?(@response, @value)
  end

  # Validates if the postcode can be served
  # @param value [Object] The value passed to the validator
  # @param response [Net::HTTPResponse]
  # @return [Boolean]
  def valid_service_area?(_response, _value)
    ServiceArea.exists?(['lower(name) = ?', lsoa_code]) || AllowedPostCode.exists?(postcode: postcode)
  end

  # Returns a formatted lsoa code
  def lsoa_code
    code = response.dig(:result, :lsoa) if response.present?
    code.nil? ? nil : code[..-6].downcase
  end

  # Returns a formatted postcode
  def postcode
    value.upcase.upcase.gsub(/\s+/, '') if value
  end

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
    json = JSON.parse(response.body)
    ActiveSupport::HashWithIndifferentAccess.new(json)
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
