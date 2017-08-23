class AddReviewAndPictureToCampgrounds < ActiveRecord::Migration[5.1]
     def change
    add_column :campgrounds, :google_picture, :string, array: true, default: []
    add_column :campgrounds, :reviews, :string, array: true, default: []
  end
end
