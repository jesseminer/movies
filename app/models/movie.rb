class Movie < ActiveRecord::Base
  validates :release_year, presence: true
  validates :title, presence: true

  mount_uploader :review, MovieImageUploader

  def image
    "images/movie#{id}.jpg"
  end
end
