
class Game
    def initialize(user='guest',intentos=10,codigo=1234)
        @user=user
        @intentos = intentos
        @codigo = codigo
    end

    def getIntentos()
        return @intentos
    end

    def setIntentos(numeroIntentos)
        @intentos = numeroIntentos
    end

    def descontarIntentos()
        @intentos -= 1
    end

    def getCode() 
        return @codigo
    end

    def setCode(numbercodigo)
        @codigo = numbercodigo
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
end
