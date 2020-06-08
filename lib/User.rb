class User
    def initialize (name="Guest",email="",password="")
        @name=name#+(rand(100)).to_s
        @email=email
        @password=password
    end

    def setNickname(name)
        @name=name
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
    def setEmail(password)
        @password=password
     end
     def getEmail()
         return @password
     end
    def setPassword(password)
       @password=password
    end
    def getPassword()
        return @password
    end
    

   
end


