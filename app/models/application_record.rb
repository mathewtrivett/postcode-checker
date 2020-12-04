# frozen_string_literal: true

# All models will inherit from this ApplicationRecord class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
