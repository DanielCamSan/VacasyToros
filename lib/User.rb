class User
    def initialize (name="Guest")
        @name=name#+(rand(100)).to_s
    end

    def getName()
        return @name
    end
    
    def seleccionTipo(tipo)
        @tipo=tipo
    end

end


