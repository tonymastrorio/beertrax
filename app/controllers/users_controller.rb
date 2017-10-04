class UsersController < ApplicationController
  use Rack::Flash

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    @user = User.new(username: params["username"], 
    email: params["email"], 
    password: params["password"])
    if @user.save
      session[:user_id] = @user.id

      redirect "/beers"
    else 
      flash[:message] = @user.errors.messages
      redirect to "/users/new"
    end
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
