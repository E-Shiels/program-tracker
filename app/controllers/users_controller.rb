class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/'
    end

    @user = User.find_by_id(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      @user = User.find_by_id(session[:user_id])
      redirect "users/#{@user.id}"
    end
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    elsif User.find_by(:email => params[:email])
      redirect to '/login'
    else
      @user = User.create(:email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/programs'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/programs"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect '/'
    else
      redirect '/'
    end
  end

end
