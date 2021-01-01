class Movies < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set(logging: true, server: :puma, views: settings.root + '/app/views')

  get '/' do
    slim :movies
  end

  get '/movies/new' do
    slim 'movies/new'.to_sym
  end

  post '/movies' do
    Movie.create(params.slice(:title, :release_year, :date_watched, :image))
    redirect to('/')
  end
end
