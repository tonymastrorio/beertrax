class UsersController < ApplicationController
  use Rack::Flash

  # GET: /signup
  get "/signup" do
    erb :"/users/new.html"
  end

  # POST: /signup
  post "/signup" do
    @user = User.new(username: params["username"], 
    email: params["email"], 
    password: params["password"])
    if @user.save
      session[:user_id] = @user.id

      redirect to "/beers"
    else 
      flash[:message] = @user.errors.messages
      redirect to "/signup"
    end
  end

  # GET: /login
  get "/login" do
    if logged_in?
      redirect to "/beers"
    else
      erb :"users/login.html"
    end
  end

  #POST: /login
  post "/login" do
    @user = User.find_by(username: params["username"])
    if @user.authenticate(params["password"])
      session["user_id"] = @user.id
      redirect to "/beers"
    else
      flash[:message] = "The username and password you entered do not match our records."
      redirect to "/login"
    end
  end

  # GET: /logout
  get '/logout' do
    session.clear

    redirect to "/login"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
