class CreateCgAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :cg_amenities do |t|
      t.references :campground
      t.references :amenity

      t.timestamps
    end
  end
end
