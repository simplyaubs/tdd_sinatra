require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    "Menu"
  end
end