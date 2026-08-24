class CreateAwarenessTips < ActiveRecord::Migration[8.1]
  def change
    create_table :awareness_tips do |t|
      t.references :appliance, null: false, foreign_key: true
      t.integer :hazard_type
      t.string :title
      t.text :actionable_mitigation

      t.timestamps
    end
  end
end
