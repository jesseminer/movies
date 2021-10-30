class AddLengthToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :length, :integer
  end
end
