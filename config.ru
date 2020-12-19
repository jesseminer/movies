require 'sinatra/base'
require 'sinatra/reloader' if Sinatra::Application.development?
require './movies'

run Movies
