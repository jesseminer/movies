class AddImageToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :image, :text
  end
end
