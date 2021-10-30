class Movie < ActiveRecord::Base
  validates :rating, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    only_integer: true,
    allow_nil: true
  }
  validates :release_year, presence: true
  validates :title, presence: true

  mount_uploader :image, MovieImageUploader

  def nice_length
    hours = length / 60
    minutes = length % 60

    if hours == 1
      "#{hours} hour #{minutes} minutes"
    else
      "#{hours} hours #{minutes} minutes"
    end
  end

  def rating_structure
    if rating == 5
      '<strong>8=====D~</strong>'
    else
      "8#{'=' * rating}D"
    end
  end
end
