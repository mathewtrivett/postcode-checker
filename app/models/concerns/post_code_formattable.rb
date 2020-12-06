# frozen_string_literal: true

# Adds post code formatting skill to models when included
# The model must have a `postcode` attribute
module PostCodeFormattable
  extend ActiveSupport::Concern

  included do
    after_validation :format_postcode
  end

  private

  def format_postcode
    self.postcode = postcode.upcase.gsub(/\s+/, '') if postcode
  end
end
