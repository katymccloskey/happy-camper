class CreateCampgrounds < ActiveRecord::Migration[5.1]
  def change
    create_table :campgrounds do |t|
      t.string :name, null: false, limit: 50
      t.string :state, null: false, limit: 2
      t.string :contract_id, null: false
      t.string :facility_id, null: false
      t.float :latitude
      t.float :longitude
      t.boolean :amps
      t.boolean :pets
      t.boolean :sewage
      t.boolean :water

      t.timestamps
    end
  end
end
