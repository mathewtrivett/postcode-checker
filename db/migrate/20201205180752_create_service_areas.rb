# frozen_string_literal: true

# Creates the service_areas table
class CreateServiceAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :service_areas do |t|
      t.string :name

      t.timestamps
    end
    add_index :service_areas, :name
  end
end
