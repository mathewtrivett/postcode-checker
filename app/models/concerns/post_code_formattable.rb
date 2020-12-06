module PostCodeFormattable
    extend ActiveSupport::Concern

    included do
      after_validation :format_postcode
    end

    private
    def format_postcode
      self.postcode = self.postcode.upcase.gsub(/\s+/, '') if self.postcode
    end
end