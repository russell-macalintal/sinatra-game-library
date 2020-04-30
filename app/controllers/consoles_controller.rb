require 'rack-flash'

class ConsolesController < ApplicationController
  use Rack::Flash

  get '/myconsoles' do
    if logged_in?
      @consoles = current_user.consoles
      @path = request.path_info
      erb :'/consoles/show_list'
    else
      redirect '/'
    end
  end

  get '/myconsoles/add' do
    if logged_in?
      @user = current_user
      @consoles = Console.all
      erb :'/consoles/add'
    else
      redirect '/'
    end
  end

  post '/myconsoles' do
    params[:console_ids].each do |console_id|
      console = Console.find(console_id)
      if !current_user.consoles.include?(console)
        current_user.consoles << console
      end
    end

    if params[:new_console] == "true"
      redirect '/consoles/new'
    else
      redirect '/myconsoles'
    end
  end

  get '/consoles' do
    if logged_in?
      @consoles = Console.all
      @path = request.path_info
      erb :'/consoles/show_list'
    else
      redirect '/'
    end
  end

# New consoles can be added by any signed-in user.
  get '/consoles/new' do
    if logged_in?
      erb :'/consoles/new'
    else
      redirect '/'
    end
  end

  post '/consoles' do
    if !Console.exists?(name: params[:name])
      new_console = Console.create(name: params[:name], manufacturer: params[:manufacturer])
      current_user.consoles << new_console
      flash[:message] = "Success: New console created in the library and added to your collection."
      if params[:new_console] == "true"
        redirect '/consoles/new'
      else
        redirect '/myconsoles'
      end
    else
      flash[:message] = "Error: Console already exists in the library."
      redirect '/consoles/new'
    end
  end

  get '/consoles/:id' do
    if logged_in?
      @console = Console.find(params[:id])
      erb :'/consoles/show_details'
    else
      redirect '/'
    end
  end

# Console details (already in the library) can only be edited by ADMIN user.
  get '/consoles/:id/edit' do
    if logged_in?
      if current_user.username == "ADMIN"
        @console = Console.find(params[:id])
        erb :'/consoles/edit'
      else
        erb :unauthorized
      end
    else
      redirect '/'
    end
  end

  patch '/consoles/:id' do
    if !Console.exists?(name: params[:name])
      Console.find(params[:id]).update(name: params[:name], manufacturer: params[:manufacturer])
      flash[:message] = "Success: Console details updated."
      redirect "/consoles/#{params[:id]}"
    else
      flash[:message] = "Error: A console with that name already exists. Check the edit."
      redirect "/consoles/#{params[:id]}/edit"
    end
  end

# Consoles (already in the library) can only be deleted by ADMIN user.
  delete '/consoles/:id/delete' do
    Console.find(params[:id]).delete
    flash[:message] = "Success: Console deleted."
    redirect '/consoles'
  end
end
