require 'sinatra'
require './lib/User.rb'
require './lib/Game.rb'

@@juego=Game.new()
@@user = User.new()


get '/' do
  erb:home_view
end



get '/login' do
    erb:login_view
end

get '/login-cuenta' do
  
  erb:accountLogin_view
end


post '/confirm' do
   @@user.setName(params[:name])
   @name=@@user.getName()
   @@user.setNickname(params[:nickname])
   @nickName = @@user.getNickname()
   erb:confirmation_view
end

post '/confirm-cuenta' do
  @@user.setEmail(params[:email])
  @@user.setPassword(params[:password])
  erb:login_view
end

get '/SelectType' do
  erb:SeleccionType_view
end


get '/menuStarGame' do
  erb:menuprincipal_view
end

post '/enterCodigo' do
  @codigo = params[:codigo]
  @@juego.setCode(@codigo)
  erb:game_view
end

post '/enterNumber' do
  @result=@@juego.validateNumbers(params[:guessCode])
  @intentos=@@juego.getIntentos()
  @intentosString=@intentos.to_s
  @codigo = @@juego.getCode()
  if(@result == (@@juego.sizeOfCode()+" toros y 0 vacas"))
    erb:winner_view
    @@juego.setIntentos(10)  
  else
    if(@intentos == 0)
      erb:losser_view
      @@juego.setIntentos(10)  
    else
      erb:response_view
    end      
  end
end

get '/game' do
  erb:login_view
end

get '/game2' do
  erb:login_view
end
