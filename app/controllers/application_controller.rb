require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "games"
  end

  get '/' do
    if logged_in?
      erb :welcome
    else
      erb :index
    end
  end

  # Helper Methods
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end
