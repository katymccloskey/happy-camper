class AddReviewAndPictureToCampgrounds < ActiveRecord::Migration[5.1]
  def change
    add_column :campgrounds, :google_picture, :string
    add_column :campgrounds, :reviews, :string
  end
end
