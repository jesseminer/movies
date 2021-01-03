class Movies < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set(logging: true, server: :puma, views: settings.root + '/app/views')

  get '/' do
    slim :movies
  end

  get '/movies/new' do
    @movie = Movie.new
    slim 'movies/new'.to_sym
  end

  post '/movies' do
    if params[:id].present?
      Movie.find(params[:id]).update(params.slice(:title, :release_year, :date_watched, :image))
    else
      Movie.create(params.slice(:title, :release_year, :date_watched, :image))
    end
    redirect to('/')
  end

  get '/movies/:id/edit' do
    @movie = Movie.find(params[:id])
    slim 'movies/new'.to_sym
  end
end
