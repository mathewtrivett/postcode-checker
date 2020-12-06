# frozen_string_literal: true

# Adds a database level uniqueness constraint on ServiceArea name
class AddUniquenessConstraintToServiceAreaName < ActiveRecord::Migration[6.0]
  def change
    remove_index :service_areas, :name
    add_index :service_areas, :name, unique: true
  end
end
