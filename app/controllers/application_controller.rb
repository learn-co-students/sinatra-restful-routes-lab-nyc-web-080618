class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  get "/recipes" do
    @recipes = Recipe.all
     erb :index
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post "/recipes" do
    @recipes = Recipe.create(params)
    redirect "/recipes/#{@recipes.id}"
  end

  patch "/recipes/:id" do
     @recipe = Recipe.find(params[:id])
     @recipe.name = params[:name]
     @recipe.ingredients = params[:ingredients]
     @recipe.cook_time = params[:cook_time]
     @recipe.save
    redirect "/recipes/#{@recipes.id}"
  end

  delete "/recipes/:id/delete" do
   @recipe = Recipe.find(params[:id])
   @recipe.delete
   erb :deleted
end









end # end of ApplicationController Class
