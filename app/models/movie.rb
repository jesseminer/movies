class Movie < ActiveRecord::Base
  validates :release_year, presence: true
  validates :title, presence: true

  def image
    "images/movie#{id}.jpg"
  end
end
