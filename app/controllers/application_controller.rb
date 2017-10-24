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
    if logged_in?
      redirect to "/beers"
    else
      erb :index
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

  private

  def authenticate_user
    if !logged_in?
      redirect "/login"
    end
  end

end
