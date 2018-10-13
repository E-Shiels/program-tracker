class ProgramsController < ApplicationController

  get '/programs' do
    redirect_if_not_logged_in
    @programs = Program.all
    erb :'programs/index'
  end

  get '/programs/new' do
    redirect_if_not_logged_in
    erb :'programs/new'
  end

  post '/programs' do
    redirect_if_not_logged_in
    @program = Program.create(params)
    redirect '/programs'
  end

  get '/programs/:id' do
    redirect_if_not_logged_in
    @program = Program.find(params[:id])
    erb :'programs/show'
  end

  get '/programs/:id/edit' do
    redirect_if_not_logged_in
    @program = Program.find(params[:id])
    erb :'programs/edit'
  end

  patch '/programs/:id' do
    redirect_if_not_logged_in
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
