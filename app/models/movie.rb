class Movie < ActiveRecord::Base
  def image
    "images/movie#{id}.jpg"
  end
end
