require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_key"
  end

  get "/" do
    @beers = Beer.all
    
    erb :index
  end

end
