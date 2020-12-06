# frozen_string_literal: true

# Adds a database level uniqueness constraint on AllowedPostCode postcode
class AddUniquenessConstraintToAllowedPostCodeIndex < ActiveRecord::Migration[6.0]
  def change
    remove_index :allowed_post_codes, :postcode
    add_index :allowed_post_codes, :postcode, unique: true
  end
end
