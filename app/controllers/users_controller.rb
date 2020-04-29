require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/login' do
    if logged_in?
      erb :welcome
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb :welcome
    else
      flash[:message] = "Error: That username/password combination was not found."
      redirect '/login'
    end
  end

  get '/signup'do
    if logged_in?
      erb :welcome
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:pw_confirm])
    if @user.save
      session[:user_id] = @user.id
      erb :welcome
    else
      flash[:message] = "Error: Please check that the passwords match or choose a different username (A user with that name may already exist)."
      redirect '/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end

# Future Features:
# Implement method to remove lettercase requirements for username attribute.
