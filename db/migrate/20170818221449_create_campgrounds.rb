class CreateCampgrounds < ActiveRecord::Migration[5.1]
  def change
    create_table :campgrounds do |t|
      t.string :name, null: false, limit: 75
      t.string :state, null: false, limit: 4
      t.string :contract_id, null: false
      t.string :facility_id, null: false
      t.float :latitude
      t.float :longitude
      t.string :amps
      t.string :pets
      t.string :sewage
      t.string :water

      t.timestamps
    end
  end
end
