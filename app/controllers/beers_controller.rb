class BeersController < ApplicationController

  # GET: /beers
  get "/beers" do
    @beers = Beer.all
    if !logged_in?
      redirect to "/"
    else
      erb :"/beers/index.html"
    end
  end

  # GET: /beers/new
  get "/beers/new" do
    erb :"/beers/new.html"
  end

  # POST: /beers
  post "/beers" do
    @beer = Beer.new(name: params["beer_name"])
    @beer.ratebeer_url = params["ratebeer_url"]
    @beer.style = params["style"]
    @beer.rating = params["rating"]
    @beer.comments = params["comments"]
    @beer.user = current_user

    if params["brewery_name"] != ""
      @beer.brewery = Brewery.find_or_create_by(name: params["brewery_name"])
      @beer.brewery.city = params["city"]
      @beer.brewery.state = params["state"]
      @beer.brewery.save
    end
    @beer.save

    redirect "/beers/#{@beer.id}"
  end

  # GET: /beers/5
  get "/beers/:id" do
    @beer = Beer.all.find(params["id"])

    erb :"/beers/show.html"
  end

  # GET: /beers/5/edit
  get "/beers/:id/edit" do
    @beer = Beer.all.find(params["id"])

    erb :"/beers/edit.html"
  end

  # PATCH: /beers/5
  patch "/beers/:id" do
    @beer = Beer.find(params["id"])
    @beer.update(params["beer"])

    @beer.brewery = Brewery.find_or_create_by(name: params["brewery_name"])
    @beer.brewery.city = params["city"]
    @beer.brewery.state = params["state"]

    @beer.save
    @beer.brewery.save

    redirect "/beers/#{@beer.id}"
  end

  # DELETE: /beers/5/delete
  delete "/beers/:id/delete" do
    @beer = Beer.find(params["id"])
    if @beer.id == current_user.id
      @beer.delete
      redirect "/beers"
    else
      redirect "/beers"
    end
  end
end
