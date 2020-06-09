
class Game
    def initialize(user='guest',intentos=10,codigo=1234)
        @user=user
        @intentos = intentos
        @codigo = codigo
    end

    def getIntentos()
        return @intentos
    end

    
    def setRandomCode()
        @numRand=(rand(9).to_i+1)*1+(rand(9).to_i+1)*10+(rand(9).to_i+1)*100+(rand(9).to_i+1)*1000
        @codigo=@numRand.to_i
    end

    def getInvitationCode()
        return ((rand(9).to_i+1)*1+(rand(9).to_i+1)*10+(rand(9).to_i+1)*100+(rand(9).to_i+1)*1000).to_s        
    end
    

    
    def setIntentos(numeroIntentos)
        if(numeroIntentos!="")
            @intentos = numeroIntentos.to_i
        end    
    end

    def descontarIntentos()
        @intentos -= 1
    end

    def getCode() 
        return @codigo
    end


    def setCode(numbercodigo)
        if(numbercodigo!="")
            @codigo = numbercodigo
        end
    end

    def sizeOfCode()
        return ((@codigo.to_s).size).to_s
    end
    
    def play(num) 
        code = getCode().to_s
        toros = 0
        vacas = 0
        num=num.to_s
        for i in (0...code.size) do
            if  (num[i] == code[i])
                toros += 1
            elsif ( code.include? num[i])
                vacas += 1
            end 
        end
        descontarIntentos()
        return "#{toros} toros y #{vacas} vacas"        
    end

    def validateNumbers(num)
        code = getCode().to_s
        if (num.to_s.size==0)
            return "No puede ser vacio el numero" 
        end        
        if ( ((num.to_i).to_s.size == num.to_s.size) && ((code.to_i).to_s.size == code.size) )
            if ( (num.to_i).to_s.size == (code.to_i).to_s.size )
                return play(num)
            else
                return "Los numeros tienen tamaños distintos"
            end
        else
            return "El codigo no deberia tener letras"
        end    
    end




    def rendirse()
        @intentos=0
        
    end
end
