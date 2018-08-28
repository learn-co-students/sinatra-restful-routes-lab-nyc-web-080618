class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end

  get'/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe=Recipe.find(params[:id])
    erb :show
  end

  post '/recipes' do
    @recipe=Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    Recipe.find(params[:id]).destroy
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe=Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe=Recipe.find(params[:id])
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end


end
