require 'sinatra'
require './lib/User.rb'
require './lib/Game.rb'

@@juego=Game.new()
@@user = User.new()
@@dif=0

get '/' do
  erb:home_view
end

get '/RegisterName' do
    erb:registerName_view
end

get '/RegisterAccount' do
  
  erb:registerAccount_view
end

post '/confirmName' do
   @@user.setName(params[:name])
   @name=@@user.getName()
   @@user.setNickname(params[:nickname])
   @nickName = @@user.getNickname()
   erb:confirmationName_view
end
post '/RegisterWithAccount' do
  @@user.setEmail(params[:email])
  @@user.setPassword(params[:password])
  erb:registerName_view
end
get '/InvitePeople' do
  @code=(@@juego.getInvitationCode())
  erb:invitation_view
end
post '/putInvitation' do
  erb:guesserCode_view
end

get '/menuStartGame' do
  erb:selectTypeCode_view
end
get '/menuNumber' do
  erb:seleccionTypePlayer_view
end

get '/menuColors' do
  erb:selectTypeColors_view
end


get '/SelectTypeGenerator' do
  erb:setCodeDificulty_view
end


get '/SelectTypeGuesser' do
  erb:guesserCode_view
  
end
post '/codeDificulty4' do
  @@dif=4
  @codeDif=@@dif.to_s
  erb:setCode_view
end
post '/codeDificulty6' do
  @@dif=6
  @codeDif=@@dif.to_s
  erb:setCode_view
end
post '/codeDificulty8' do
  @@dif=8
  @codeDif=@@dif.to_s
  erb:setCode_view
end
post '/codeDificultyPer' do
  erb:setCodePer_view
end

post '/verifySizeCode' do
  @codigo = params[:codigo]
  @codigoS=@codigo.to_s
  @code=@codigoS.size
  if(@code!=@@dif)
    @difS=@@dif.to_s
    @codeS=@code.to_s
    erb:errorSize_view
  else
    @@juego.setCode(@codigo)
    erb:setNumberOfTries_view
  end
end
post '/setRandomCode' do
  if(@@dif==8)
    @@juego.setRandomCodeEight()
  else
    if(@@dif==6)
      @@juego.setRandomCodeSix()
    else
      @@juego.setRandomCode()
    end
  end
  erb:setNumberOfTries_view
end

post '/setCode' do
  @codigo = params[:codigo]
  @@juego.setCode(@codigo)
  erb:setNumberOfTries_view
end
post '/GuessCode' do
  @trie = params[:tries]
  @@juego.setIntentos(@trie)
  @@dif=0
  erb:guesserCode_view
end


post '/GuessCode1' do
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

post '/giveup' do
  @@juego.rendirse()
  @codigo = @@juego.getCode()
  erb:losser_view
end
get '/game' do
  erb:guesserCode_view
end

get '/game2' do
  @@juego.setIntentos(10)
  erb:registerName_view
end
