require 'sinatra'
require './lib/User.rb'
require './lib/Game.rb'

@@juego=Game.new()


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
  else
    if(@intentos == 0)
      erb:losser_view
    else
      erb:response_view
    end      
  end
end


get '/game' do
  erb:game_view
end

get '/game2' do
  erb:login_view
end
