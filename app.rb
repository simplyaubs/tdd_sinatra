require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    erb :homepage
  end
end