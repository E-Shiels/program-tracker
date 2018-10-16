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
    @program = Program.new
    @program.name = params[:name]
    @program.category = params[:category].slice(0,1).capitalize + params[:category].slice(1..-1)
    @program.description = params[:description].slice(0,1).capitalize + params[:description].slice(1..-1)
    @program.url = params[:url]
    @program.install_date = Chronic.parse(params[:install_date]).to_datetime.strftime("%F")
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
