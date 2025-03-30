class MovieImageUploader < CarrierWave::Uploader::Base
  def default_url
    ENV['DEFAULT_MOVIE_IMAGE_URL']
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def store_dir
    "images/#{model.id}"
  end
end
