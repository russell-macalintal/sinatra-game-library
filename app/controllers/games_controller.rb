class GamesController < ApplicationController
  get '/mygames' do
    @games = current_user.games
    erb :'/games/show_all'
  end

  get '/games' do
    @games = Game.all
    erb :'/games/show_all'
  end

  get '/games/new' do

  end

  post '/games' do

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
