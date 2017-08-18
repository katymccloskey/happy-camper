class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :campground

      t.timestamps
    end
  end
end
