require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "gamesgamesgames"
  end

  get '/' do
    erb :index
  end

  # Helper Methods
end
