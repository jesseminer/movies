CarrierWave.configure do |config|
  if Sinatra::Base.production?
    config.storage = :fog
    config.fog_credentials = {
      provider: 'Google',
      google_project: 'movies-300417',
      google_json_key_string: ENV.fetch('GOOGLE_JSON_KEY')
    }
    config.fog_directory = 'jkmovies'
  else
    config.storage = :file
    config.root = Dir.pwd
  end
end
