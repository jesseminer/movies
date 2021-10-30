class Movies < Sinatra::Base
  VALID_MOVIE_ATTRIBUTES = [:title, :release_year, :date_watched, :image, :rating, :length]

  configure :development do
    register Sinatra::Reloader
    also_reload './app/**/*.rb'
  end

  set(logging: true, server: :puma, views: settings.root + '/app/views')

  get '/' do
    @sort_order = params[:order] || 'recently_watched'
    @movies = sort_movies(Movie.all)
    slim :movies
  end

  get '/movies/new' do
    @movie = Movie.new
    slim 'movies/new'.to_sym
  end

  post '/movies' do
    if params[:id].present?
      Movie.find(params[:id]).update(params.slice(*VALID_MOVIE_ATTRIBUTES))
    else
      Movie.create(params.slice(*VALID_MOVIE_ATTRIBUTES))
    end
    redirect to('/')
  end

  get '/movies/:id/edit' do
    @movie = Movie.find(params[:id])
    slim 'movies/new'.to_sym
  end

  private

  def sort_movies(movies)
    if @sort_order == 'recently_watched'
      movies.order(date_watched: :desc)
    elsif @sort_order == 'best_rated'
      movies.order(rating: :desc)
    elsif @sort_order == 'newest'
      movies.order(release_year: :desc)
    else
      movies
    end
  end
end
