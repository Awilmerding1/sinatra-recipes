class RecipesController < ApplicationController


  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  get '/recipes/new' do
    if !Helpers.is_logged_in?(session)
      redirect '/'
    end
    erb :'recipes/new'
  end


  post '/recipes' do
    recipe = Recipe.create(params)
    user = Helpers.current_user(session)
    recipe.user = user
    recipe.save
    redirect to "/users/#{user.id}"
  end

  get '/recipes/:id' do
    if !Helpers.is_logged_in?(session)
      redirect '/'
    end
    @recipe = Recipe.find_by(id: params[:id])
    if !@recipe
      redirect to '/'
    end
    erb :'recipes/show'
  end

end
