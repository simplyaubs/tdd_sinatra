require 'sinatra/base'

class App < Sinatra::Application

  set :menu_hash, {}

  get '/' do
    erb :homepage
  end

  get '/Items' do
    erb :items, :locals => {:menu => settings.menu_hash}
  end

  get '/Items/forms' do
    erb :add_form
  end

  post '/Items' do
    name = params[:name]
    if settings.menu_hash.empty?
      id = 0
    else
      id = settings.menu_hash.keys[-1] + 1
    end
    settings.menu_hash[id] = name

    redirect '/Items'
  end

  get '/Items/:id' do
    erb :item_details, :locals => {:menu => settings.menu_hash, :id => params[:id]}
  end

  get '/Items/:id/edit' do
    erb :edit_form, :locals => {:id => params[:id]}
  end

  post '/Items/:id' do
    settings.menu_hash[params[:id].to_i] = params[:name]
    redirect "/Items/#{params[:id]}"
  end

  delete '/Items' do
    settings.menu_hash.delete(params[:id].to_i)
    redirect '/Items'
  end
end
