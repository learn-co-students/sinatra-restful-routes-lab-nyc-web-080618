class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @name = params[:name]
    @ingredients= params[:ingredients]
    @cook_time = params[:cook_time]
    @recipe = Recipe.create(name: @name, ingredients: @ingredients, cook_time: @cook_time)
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect :"/recipes/#{params[:id]}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

end
