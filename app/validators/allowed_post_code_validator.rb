
require 'net/http'

class AllowedPostCodeValidator < ActiveModel::EachValidator
  def self.client
    Net::HTTP.new ENV['POSTCODE_VALIDATION_SERVICE_URI']
  end

  def self.get_postcode value
    client.get("/postcodes/#{value}")
  end
end