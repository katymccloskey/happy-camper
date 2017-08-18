class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.string :description, null: false
      t.string :reservation_url
      t.string :important_info
      t.string :recreations
      t.string :city, null: false
      t.string :state, null: false
      t.string :address
      t.string :zip_code
      t.string :contact
      t.refernces :campground

      t.timestamps
    end
  end
end
