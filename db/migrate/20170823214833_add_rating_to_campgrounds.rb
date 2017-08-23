class AddRatingToCampgrounds < ActiveRecord::Migration[5.1]
  def change
    add_column :campgrounds, :rating, :integer
  end
end
