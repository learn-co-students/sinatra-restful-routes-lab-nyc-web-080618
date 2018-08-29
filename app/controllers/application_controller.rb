class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    #show all recipes
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do #render form to create new recipe
    erb :new
  end

  post '/recipes' do #persist data from form to db
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    #find individual recipes
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do #render form to edit recipe
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #update db
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end


  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    erb :index
  end



end #END APPCONTROLLER
