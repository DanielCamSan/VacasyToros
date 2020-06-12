class User
    def initialize (name="",nickname="",email="",password="")
        @name=name
        @nickName=nickname
        @email=email
        @password=password
    end
    def setNickname(nick)
        if nick==""
            nick=getName()+(rand(100)).to_s
        end
        @nickName=nick
    end
    def getNickname()
        return @nickName
    end
    def getName()
        return @name
    end
    def setName(name1)
        if name1 == ""
            name1="Guest"
        end
        @name=name1
    end
    def setTipo(tipo=1)
       @tipo=tipo
    end
    def getTipo()
        return @tipo
    end
    def getEmail()
        return @email
    end
    def setEmail(email)
        @email=email
    end
    def setPassword(password)
       @password=password
    end
    def getPassword()
        return @password
    end
end