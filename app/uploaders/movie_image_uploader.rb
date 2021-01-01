class MovieImageUploader < CarrierWave::Uploader::Base
  def default_url
    '/images/movie_placeholder.jpg'
  end

  def store_dir
    "images/#{model.id}"
  end
end
