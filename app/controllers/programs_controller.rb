class ProgramsController < ApplicationController

  get '/programs' do
    redirect_if_not_logged_in
    @programs = current_user.programs
    erb :'programs/index'
  end

  get '/programs/new' do
    redirect_if_not_logged_in
    erb :'programs/new'
  end

  post '/programs' do
    redirect_if_not_logged_in
    @program = Program.new(:name => params[:name], :category => params[:category].capitalize, :description => params[:description].capitalize, :url => params[:url], :user_id => current_user.id)

  #  @program.name = params[:name]
    # if params[:category].nil? || params[:category].blank? || params[:category].empty?
    #   @program.category = params[:category]
    # else
      # @program.category = params[:category].capitalize
    # end
    # if params[:description].nil? || params[:description].blank? || params[:description].empty?
    #   @program.description = params[:description]
    # else
    #   @program.description = params[:description].capitalize
    # end
  #  @program.url = params[:url]

    if Chronic.parse(params[:install_date]).nil?
      @program.install_date = params[:install_date]
    else
      @program.install_date = Chronic.parse(params[:install_date]).to_datetime.strftime("%B %d, %Y")
    end

  #  @program.user_id = current_user.id

    @program.save
    redirect to "/programs/#{@program.id}"
  end

  get '/programs/:id' do
    redirect_if_not_logged_in
    @program = Program.find(params[:id])

    if @program.user_id == current_user.id
      erb :'programs/show'
    else
      redirect to "/programs"
    end
  end

  get '/programs/:id/edit' do
    redirect_if_not_logged_in
    @program = Program.find(params[:id])

    if @program.user_id == current_user.id
      erb :'programs/edit'
    else
      redirect to "/programs"
    end
  end

  post '/programs/:id' do
    redirect_if_not_logged_in
    @program = Program.find_by_id(params[:id])
    if @program.user_id == current_user.id
      @program.update(params)
      redirect to "/programs/#{@program.id}"
    else
      redirect to "/programs"
    end
  end

  delete '/programs/:id/delete' do
    @program = Program.find_by_id(params[:id])
    if @program.user_id == current_user.id
      @program.destroy
      redirect to "/programs"
    else
      redirect to "/programs"
    end
  end

end
