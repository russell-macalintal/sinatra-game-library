require 'rack-flash'

class GamesController < ApplicationController
  use Rack::Flash

  get '/mygames' do
    if logged_in?
      @games = current_user.games
      @path = request.path_info
      erb :'/games/show_list'
    else
      redirect '/'
    end
  end

  get '/mygames/add' do
    if logged_in?
      @user = current_user
      @games = Game.all
      erb :'/games/add'
    else
      redirect '/'
    end
  end

  post '/mygames' do
    params[:game_ids].each do |game_id|
      game = Game.find(game_id)
      if !current_user.games.include?(game)
        current_user.games << game
      end
    end

    if params[:new_game] == "true"
      redirect '/games/new'
    else
      redirect '/mygames'
    end
  end

  get '/games' do
    if logged_in?
      @games = Game.all
      @path = request.path_info
      erb :'/games/show_list'
    else
      redirect '/'
    end
  end

# New games can be added by any signed-in user.
  get '/games/new' do
    if logged_in?
      erb :'/games/new'
    else
      redirect '/'
    end
  end

  post '/games' do
    if !Game.exists?(name: params[:name])
      new_game = Game.create(name: params[:name])
      current_user.games << new_game
      flash[:message] = "Success: New game created in the library and added to your collection."
      if params[:new_game] == "true"
        redirect '/games/new'
      else
        redirect '/mygames'
      end
    else
      flash[:message] = "Error: Game already exists in the library."
      redirect '/games/new'
    end
  end

  get '/games/:id' do
    if logged_in?
      @game = Game.find(params[:id])
      erb :'/games/show_details'
    else
      redirect '/'
    end
  end

# Game details (already in the library) can only be edited by ADMIN user.
  get '/games/:id/edit' do

  end

  patch '/games/:id/edit' do

  end

  delete '/games/:id/delete' do

  end
end

# Implement validation to check if game is already on a User's library in order to prevent duplicates.
