require 'sinatra'
require './lib/User.rb'
get '/' do
    erb:home_view
  end
get '/login' do
    erb:login_view
end
post '/confirm' do
   @user=User.new(params[:name])
   @name=params[:name]
   @nickName = @user.getName()
   erb:confirmation_view
end

get '/menuStarGame' do
  "Hello World"
  erb:menuprincipal_view
end
