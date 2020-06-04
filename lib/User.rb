class User
    def initialize (name="Guest")
        @name=name#+(rand(100)).to_s
    end

    def getName()
        return @name
    end
    def setTipo(tipo=1)
       @tipo=tipo
    end
    def getTipo()
        return @tipo
    end

   
end


