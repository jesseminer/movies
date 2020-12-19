class Movies < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set(logging: true, server: :puma, views: settings.root + '/app/views')

  get '/' do
    slim :movies
  end
end
