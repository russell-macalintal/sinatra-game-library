class DevelopersController < ApplicationController

   
    get '/developers/new' do
        erb :'/developers/new'
    end

    post '/developers' do
        @developer = Developer.create(name: params[:developer][:name])
        redirect "/developers/#{@developer.id}"
    end

    get '/developers/:id' do
        @developer = Developer.find(params[:id])
        erb :'/developers/show'
    end
end