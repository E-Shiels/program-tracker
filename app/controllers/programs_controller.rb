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
    if @program.install_date.class == DateTime
      @program.install_date = @program.install_date.to_datetime.strftime("%F")
    else
      @program.install_date = Chronic.parse(@program.install_date)
    end
    redirect to "/programs/#{@program.id}"
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

  post '/programs/:id' do
    redirect_if_not_logged_in
    @program = Program.find_by_id(params[:id])
    @program.update(params)
    @program.save
    redirect to "/programs/#{@program.id}"
  end

  delete '/programs/:id/delete' do
    @program = Program.find_by_id(params[:id])
    @program.destroy
    redirect '/programs'
  end

end
