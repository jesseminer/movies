class Movies < Sinatra::Base
  VALID_MOVIE_ATTRIBUTES = [:title, :release_year, :date_watched, :image, :rating, :length]

  configure :development do
    register Sinatra::Reloader
    also_reload './app/**/*.rb'
  end

  set(logging: true, server: :puma, views: settings.root + '/app/views')

  helpers Sinatra::Cookies

  get '/' do
    cookies[:order] = params[:order] if params[:order].present?
    @sort_order = cookies[:order] || 'recently_watched'
    @movies = sort_movies(Movie.watched)
    slim :movies
  end

  get '/movies/new' do
    @movie = Movie.new
    slim 'movies/new'.to_sym
  end

  post '/movies' do
    if params[:id].present?
      movie = Movie.find(params[:id])
      movie.update(params.slice(*VALID_MOVIE_ATTRIBUTES))
    else
      movie = Movie.create(params.slice(*VALID_MOVIE_ATTRIBUTES))
    end
    redirect to(movie.date_watched.present? ? '/' : '/watchlist')
  end

  get '/movies/:id/edit' do
    @movie = Movie.find(params[:id])
    slim 'movies/new'.to_sym
  end

  get '/insights' do
    slim 'insights/show'.to_sym
  end

  get '/watchlist' do
    @movies = Movie.not_watched
    slim 'watchlist/show'.to_sym
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
