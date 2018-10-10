require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "programtrackingisnosecret"
  end

get '/' do
  erb :index
  #Main page
end

end
