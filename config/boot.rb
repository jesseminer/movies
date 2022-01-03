require 'sinatra/base'
require 'sinatra/reloader' if Sinatra::Application.development?
require 'sinatra/activerecord'
require 'fog/google'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

require './config/initializers/carrierwave'
require './app/uploaders/movie_image_uploader'
require './app/models/movie'
require './app/helpers'
