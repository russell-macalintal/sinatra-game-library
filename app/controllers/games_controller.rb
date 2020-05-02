require 'rack-flash'

class GamesController < ApplicationController
  use Rack::Flash

  get '/mygames' do
    if logged_in?
      if current_user.username == "ADMIN"
        current_user.games.clear
      end
      @games = current_user.games
      @path = request.path_info
      erb :'/games/show_list'
    else
      redirect '/'
    end
  end

  get '/mygames/update' do
    if logged_in?
      @user = current_user
      @games = Game.all
      erb :'/games/update'
    else
      redirect '/'
    end
  end

  post '/mygames' do
    current_user.games.clear
    if params[:game_ids]
      params[:game_ids].each do |game_id|
        game = Game.find(game_id)
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
    if params[:name] =~ /\A\s*\Z/ || params[:name].empty?
      flash[:message] = "Error: Invalid Input"
      redirect '/games/new'
    else
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
    if logged_in?
      if current_user.username == "ADMIN"
        @game = Game.find(params[:id])
        erb :'/games/edit'
      else
        erb :unauthorized
      end
    else
      redirect '/'
    end
  end

  patch '/games/:id' do
    if !Game.exists?(name: params[:name])
      Game.find(params[:id]).update(name: params[:name])
      flash[:message] = "Success: Game details updated."
      redirect "/games/#{params[:id]}"
    else
      flash[:message] = "Error: A game with that name already exists. Check the edit."
      redirect "/games/#{params[:id]}/edit"
    end
  end

# Games (already in the library) can only be deleted by ADMIN user.
  delete '/games/:id/delete' do
    Game.find(params[:id]).delete
    flash[:message] = "Success: Game deleted."
    redirect '/games'
  end
end
