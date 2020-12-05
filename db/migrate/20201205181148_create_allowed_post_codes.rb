class CreateAllowedPostCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :allowed_post_codes do |t|
      t.string :postcode
      t.references :service_area, null: true, foreign_key: true

      t.timestamps
    end
    add_index :allowed_post_codes, :postcode
  end
end
