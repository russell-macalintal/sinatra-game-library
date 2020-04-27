class GamesController < ApplicationController
  get '/mygames' do
    if logged_in?
      @games = current_user.games
      @path = request.path_info
      erb :'/games/show_all'
    else
      redirect '/'
    end
  end

  get '/mygames/add' do
    if logged_in?
      @games = Game.all
      erb :'/games/add'
    else
      redirect '/'
    end
  end

  post '/mygames' do
    params[:game_ids].each do |game_id|
      current_user.games << Game.find(game_id)
    end

    if params[:new_game] == true
      redirect '/games/new'
    else
      redirect '/myconsoles/add'
    end
  end

  get '/games' do
    if logged_in?
      @games = Game.all
      @path = request.path_info
      erb :'/games/show_all'
    else
      redirect '/'
    end
  end

  get '/games/new' do
    if logged_in?
      @games = Game.all
      erb :'/games/new'
    else
      redirect '/'
    end
  end

  post '/games' do
    current_user << Game.create(name: params[:name])

    if params[:new_game] == true
      redirect '/games/new'
    else
      redirect '/myconsoles/add'
    end
  end

  get '/games/:id' do
    @game = Game.find(params[:id])
    erb :'/games/show_details'
  end

  get '/games/:id/edit' do

  end

  patch '/games/:id/edit' do

  end

  delete '/games/:id/delete' do

  end
end

# Implement validation to check if game is already on a User's library in order to prevent duplicates.
