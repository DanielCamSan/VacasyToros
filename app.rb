require 'sinatra'
require './lib/User.rb'
require './lib/Game.rb'

@@juego=Game.new()
@@user = User.new()
@@dif=0

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

get '/codeInvitePeople' do
  @code=(@@juego.getInvitationCode())
  erb:invitation_view
end

post '/putInvitation' do
  erb:game_view
end



get '/menuStarGame' do
  erb:selectTypeCode_view
end

get '/SelectType1' do
  erb:codeDificulty_view
end
get '/menuNumber' do
  erb:SeleccionType_view
end
get '/menuColors' do
  erb:selectTypeColors_view
end

get '/SelectType2' do
  erb:game_view
  
end

post '/enterCodigo' do
  @codigo = params[:codigo]
  @@juego.setCode(@codigo)
  erb:dificultad_view
end

post '/enterCodigoPer' do
  @codigo = params[:codigo]
  @codigoS=@codigo.to_s
  @code=@codigoS.size
  if(@code!=@@dif)
    @difS=@@dif.to_s
    @codeS=@code.to_s
    erb:errorSize_view
  else
    @@juego.setCode(@codigo)
    erb:dificultad_view
  end
end

post '/correctCode' do
  @codeDif=@@dif.to_s
  erb:DifficultySelection_view
end


post '/enterNumber' do
  @result=@@juego.validateNumbers(params[:guessCode])
  @intentos=@@juego.getIntentos()
  @intentosString=@intentos.to_s
  @codigo = @@juego.getCode()
  if(@result == (@@juego.sizeOfCode()+" toros y 0 vacas"))
    @@juego.setIntentos(10)
    erb:winner_view
      
  else
    if(@intentos == 0)
      @@juego.setIntentos(10)
      erb:losser_view
        
    else
      erb:response_view
    end      
  end
end

post '/Randomizar' do
  @@juego.setRandomCode()
  erb:dificultad_view
end

post '/RandomizarPer' do
  if(@@dif==4)
    @@juego.setRandomCode()
  else
    if(@@dif==6)
      @@juego.setRandomCodeSix()
    else
      @@juego.setRandomCodeEight()
    end
  end
  erb:dificultad_view
end

post '/codeDificulty4' do
  @@dif=4
  @codeDif=@@dif.to_s
  erb:DifficultySelection_view
end
post '/codeDificulty6' do
  @@dif=6
  @codeDif=@@dif.to_s
  erb:DifficultySelection_view
end
post '/codeDificulty8' do
  @@dif=8
  @codeDif=@@dif.to_s
  erb:DifficultySelection_view
end
post '/codeDificultyPer' do
  erb:menuprincipal_view
end

post '/difficulty' do
  @trie = params[:tries]
  @@juego.setIntentos(@trie)
  @@dif=0
  erb:game_view
  

end

post '/giveup' do
  @@juego.rendirse()
  @codigo = @@juego.getCode()
  erb:losser_view
end
get '/game' do
  
  erb:game_view
end

get '/game2' do
  @@juego.setIntentos(10)
  erb:login_view
end
