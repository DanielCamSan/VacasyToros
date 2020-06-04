require 'sinatra'
require './lib/User.rb'
require './lib/Game.rb'

@juego=Game.new()

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
  erb:menuprincipal_view
end

post '/enterCodigo' do
  @codigo = params[:codigo]
  @juego.setCode(@codigo)
  @maxlength = @juego.getCode().size.to_s
  erb:game_view
end

get '/enterNumber' do
  
end

