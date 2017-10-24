class BeersController < ApplicationController

  # GET: /beers
  get "/beers" do
    authenticate_user
    @beers = Beer.all
    erb :"/beers/index.html"
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
    authenticate_user
    find_beer
    erb :"/beers/show.html"
  end

  # GET: /beers/5/edit
  get "/beers/:id/edit" do
    find_beer
    if @beer.user != current_user
      redirect "/beers/#{@beer.id}"
    else
      erb :"/beers/edit.html"
    end
  end

  # PATCH: /beers/5
  patch "/beers/:id" do
    find_beer
    if @beer.user == current_user
      @beer.update(params["beer"])

      @beer.brewery = Brewery.find_or_create_by(name: params["brewery_name"])
      @beer.brewery.city = params["city"]
      @beer.brewery.state = params["state"]

      @beer.save
      @beer.brewery.save
    end
    redirect "/beers/#{@beer.id}"
  end

  # DELETE: /beers/5/delete
  delete "/beers/:id/delete" do
    find_beer
    if @beer.user == current_user
      @beer.delete
    end
    redirect "/beers"
  end

  private 

  def find_beer
    @beer = Beer.find_by_id(params["id"])
    if !@beer
      redirect "/beers"
    end
  end


end
