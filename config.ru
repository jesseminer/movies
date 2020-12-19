require 'sinatra/base'
require 'sinatra/reloader' if Sinatra::Application.development?
require './app/models/movie'
require './movies'

run Movies
