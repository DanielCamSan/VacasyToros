
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
    def setRandomCodeSix()
        @numRand=(rand(9).to_i+1)*1+(rand(9).to_i+1)*10+(rand(9).to_i+1)*100+(rand(9).to_i+1)*1000+(rand(9).to_i+1)*10000+(rand(9).to_i+1)*100000
        @codigo=@numRand.to_i
    end
    def setRandomCodeEight()
        @numRand=(rand(9).to_i+1)*1+(rand(9).to_i+1)*10+(rand(9).to_i+1)*100+(rand(9).to_i+1)*1000+(rand(9).to_i+1)*10000+(rand(9).to_i+1)*100000+(rand(9).to_i+1)*1000000+(rand(9).to_i+1)*10000000
        @codigo=@numRand.to_i
    end
    
    def getInvitationCode()
        return ((rand(9).to_i+1)*1+(rand(9).to_i+1)*10+(rand(9).to_i+1)*100+(rand(9).to_i+1)*1000).to_s        
    end
    
    def sameSize(num1,num2)
        #devuelve true si es el mismo tamaño y false si no es
        @aux=false
        if(num1.to_s.size == num2.to_s.size)
            @aux=true
        end
        return @aux
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
        encontrados = []
        var=0
        for i in (0...code.size) do
            if  (num[i] == code[i])
                toros += 1
                encontrados.push(num[i])
            end
        end
        for i in (0...code.size) do
            if ( code.include?(num[i]) )
                if( !encontrados.include?(num[i]))
                    vacas += 1
                end
            end
        end
        descontarIntentos()
        return "#{toros} toros y #{vacas} vacas"        
    end

    def validateNumbers(num)
        code = getCode().to_s
        if (num.to_s==' ')
            return "No puede ser vacio el numero" 
        end        
        if ( ((num.to_i).to_s.size == num.to_s.size) && ((code.to_i).to_s.size == code.size) )
            if ( (num.to_i).to_s.size == (code.to_i).to_s.size )
                return play(num)
            else
                return "El codigo tiene un tamaño distinto"
            end
        else
            return play(num)
        end    
    end
    def rendirse()
        @intentos=0
    end
    def setCodeColorsToInt(colorCode)
        #1:R-Red     2:Y-Yellow   3:B-Blue     4:G-Green  5:W-White
        #6:P-Purple  7:O-Orange   8:F-Fuchsia  9:S-Silver 0:L-Lime
        colorCode=colorCode.to_s
        cod=""
        for i in (0...colorCode.size) do
            case colorCode[i]
                when "R"
                    cod=cod+"1"
                when "Y"
                    cod=cod+"2"
                when "B"
                    cod=cod+"3"
                when "G"
                    cod=cod+"4"
                when "W"
                    cod=cod+"5"
                when "P"
                    cod=cod+"6"
                when "O"
                    cod=cod+"7"
                when "F"
                    cod=cod+"8"
                when "S"
                    cod=cod+"9"
                when "L"
                    cod=cod+"0"
            end 
        end
        cod=cod.to_i
        return cod
    end
    def getCodeIntToColors()
        #1:R-Red     2:Y-Yellow   3:B-Blue     4:G-Green  5:W-White
        #6:P-Purple  7:O-Orange   8:F-Fuchsia  9:S-Silver 0:L-Lime
        colorCode=@codigo.to_s
        cod=""
        for i in (0...colorCode.size) do
            case colorCode[i]
                when "1"
                    cod=cod+"R"
                when "2"
                    cod=cod+"Y"
                when "3"
                    cod=cod+"B"
                when "4"
                    cod=cod+"G"
                when "5"
                    cod=cod+"W"
                when "6"
                    cod=cod+"P"
                when "7"
                    cod=cod+"O"
                when "8"
                    cod=cod+"F"
                when "9"
                    cod=cod+"S"
                when "0"
                    cod=cod+"L"
            end 
        end
        return cod
    end
end
