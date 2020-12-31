class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.text :title, null: false
      t.integer :release_year, null: false
      t.text :review
      t.date :date_watched
      t.integer :rating
      t.timestamps null: false
    end
  end
end
