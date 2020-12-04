# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join('spec/cassettes')
  c.ignore_localhost = true
  c.hook_into :webmock
end