class Movies < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set(logging: true, server: :puma)

  get '/' do
    'Hello world!'
  end
end
