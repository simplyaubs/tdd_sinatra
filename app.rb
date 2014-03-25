require 'sinatra/base'

class App < Sinatra::Base

  set :menu_hash, {}

  get '/' do
    erb :homepage
  end

  get '/Items' do
    erb :items, :locals => {:menu => settings.menu_hash}
  end

  get '/Items/forms' do
    erb :forms
  end

  post '/Items' do
    name = params[:name]
    option = params[:item_option]
    if settings.menu_hash.empty?
      id = 0
    else
      id = settings.menu_hash.keys[-1] + 1
    end
    if option == 'add'
      settings.menu_hash[id] = name
    end

    erb :items, :locals => {:menu => settings.menu_hash}
  end
end