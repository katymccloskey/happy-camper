class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.string :name, limit: 20

      t.timestamps
    end
  end
end
