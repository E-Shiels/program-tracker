class ProgramsController < ApplicationController

  get '/programs' do
    redirect_if_not_logged_in
    @programs = Program.all.select {|program| program.user_id == current_user.id}
    erb :'programs/index'
  end

  get '/programs/new' do
    redirect_if_not_logged_in
    erb :'programs/new'
  end

  post '/programs' do
    redirect_if_not_logged_in
    @program = Program.create(params)
    @program.install_date = Chronic.parse(@program.install_date).to_datetime.strftime("%F")
    @program.user_id = current_user.id
    @program.save
    redirect to "/programs/#{@program.id}"
  end

  get '/programs/:id' do
    redirect_if_not_logged_in
    @program = Program.find(params[:id])
    if @program.user_id = current_user.id
      erb :'programs/show'
    else
      redirect to "/programs"
    end
  end

  get '/programs/:id/edit' do
    redirect_if_not_logged_in
    @program = Program.find(params[:id])
    if @program.user_id = current_user.id
    erb :'programs/edit'
  else
    redirect to "/programs"
  end
  end

  post '/programs/:id' do
    redirect_if_not_logged_in
    @program = Program.find_by_id(params[:id])
    if @program.user_id = current_user.id
    @program.update(params)
    @program.save
    redirect to "/programs/#{@program.id}"
  else
    redirect to "/programs"
  end
  end

  delete '/programs/:id/delete' do
    @program = Program.find_by_id(params[:id])
    if @program.user_id = current_user.id
    @program.destroy
    redirect '/programs'
  else
    redirect to "/programs"
  end
  end

end
