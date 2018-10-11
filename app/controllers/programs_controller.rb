class ProgramsController < ApplicationController


  get '/programs' do
    @programs = Program.all
    erb :'programs/index'
  end

  get '/programs/new' do
    erb :'programs/new'
  end

  get '/programs/:id' do
    @program = Program.find(params[:id])
    erb :'programs/edit'
  end

  get '/programs/:id/edit' do
    @program = Program.find(params[:id])
    erb :'programs/edit'
  end

  post '/programs' do

  end

  patch '/programs/:id' do

  end

  delete '/programs/:id/delete' do

  end

end
