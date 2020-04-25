class UsersController < ApplicationController
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
      redirect '/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
