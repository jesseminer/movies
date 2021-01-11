class Movie < ActiveRecord::Base
  validates :rating, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    only_integer: true
  }
  validates :release_year, presence: true
  validates :title, presence: true

  mount_uploader :image, MovieImageUploader

  def rating_structure
    if rating == 5
      '<strong>8=====D~</strong>'
    else
      "8#{'=' * rating}D"
    end
  end
end
