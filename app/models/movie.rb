class Movie < ActiveRecord::Base
  validates :release_year, presence: true
  validates :title, presence: true

  mount_uploader :image, MovieImageUploader
end
