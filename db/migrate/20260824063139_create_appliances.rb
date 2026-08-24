class CreateAppliances < ActiveRecord::Migration[8.1]
  def change
    create_table :appliances do |t|
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.string :model_number
      t.decimal :price_thb, precision: 10, scale: 2
      t.integer :quality_tier
      t.string :form_factor
      t.json :specs
      t.text :verdict_summary
      t.boolean :verified_for_thai_climate

      t.timestamps
    end
    add_index :appliances, :model_number
    add_index :appliances, :price_thb
    add_index :appliances, :quality_tier
  end
end
