class CreateCampgrounds < ActiveRecord::Migration[5.1]
  def change
    create_table :campgrounds do |t|
      t.string :name
      t.string :state
      t.string :picture
      t.string :contract_id
      t.string :facility_id
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
