class ProgramsController < ApplicationController

  get '/programs' do
    @programs = Program.all
    erb :'programs/index'
  end

  get '/programs/new' do
    erb :'programs/new'
  end

  post '/programs' do
    @program = Program.create(params['program'])
    redirect '/programs/:id'
  end

  get '/programs/:id' do
    @program = Program.find(params[:id])
    erb :'programs/show'
  end

  get '/programs/:id/edit' do
    @program = Program.find(params[:id])
    erb :'programs/edit'
  end

  patch '/programs/:id' do
    @program = Program.find_by_id(params[:id])
    @program.update(params[:program])
    @program.save
    redirect to '/programs/#{@program.id}'
  end

  delete '/programs/:id/delete' do
    @program = Program.find_by_id(params[:id])
    @program.destroy
    redirect '/programs'
  end

end
