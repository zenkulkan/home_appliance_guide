class CreateBrands < ActiveRecord::Migration[8.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :country_of_origin
      t.integer :service_rating
      t.string :official_distributor

      t.timestamps
    end
  end
end
