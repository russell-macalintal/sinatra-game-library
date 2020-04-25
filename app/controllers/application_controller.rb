require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "games"
  end

  get '/' do
    erb :index
  end

  # Helper Methods
  def logged_in?
    !!session[:user_id]
  end
end
