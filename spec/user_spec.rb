require './lib/User.rb'
require 'Game.rb'
RSpec.describe "Creacion" do
    it 'devuelve un nombre un nombre por defecto si se creo correctamente sin indicar el nombre' do
        @user=User.new
        expect(@user.getName()).to eq("")
    end
    it 'ectamente sin indicar el nombre' do
        @user=User.new("")
        expect(@user.getName()).to eq("")
    end
    it 'devuelve nombre que ingresa ' do
        @user=User.new("JUAN")
        expect(@user.getName()).to eq('JUAN')
    end
    it 'devuelve nombre que ingresa manualmente ' do
        @user=User.new()
        @user.setName("JUAN")
        expect(@user.getName()).to eq('JUAN')
    end
    it 'devuelve nombre Guest que ingresa manualmente ' do
        @user=User.new()
        @user.setName("")
        expect(@user.getName()).to eq('Guest')
    end
    it 'devuelve el codigo para ver que se ingreso correctamente' do
        @juego=Game.new()
        @juego.setCode(123)
        expect(@juego.getCode()).to eq(123)
    end

    it 'devuelve 3 toros' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setCode(123)
        expect(@juego.play(123)).to eq("3 toros y 0 vacas")
    end
    it 'devuelve 0 toros y 0 vacas' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setCode(123)
        expect(@juego.play(567)).to eq("0 toros y 0 vacas")
    end
    it 'devuelve 3 Vacas' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setCode(123)
        expect(@juego.play(312)).to eq("0 toros y 3 vacas")
    end
    it 'devuelve 2 toros y cero vacas' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setCode(123)
        expect(@juego.play(129)).to eq("2 toros y 0 vacas")
    end
    it 'devuelve el numero correspondido de toros y vacas al validar el codigo' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setCode(123)
        expect(@juego.validateNumbers(546)).to eq("0 toros y 0 vacas")
    end
    it 'devuelve no son del mismo tamaño al validar el codigo' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setCode(123)
        expect(@juego.validateNumbers(5464)).to eq("Los numeros tienen tamaños distintos")
    end
    it 'devuelve no puede tener letras al validar el codigo' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setCode(123)
        expect(@juego.validateNumbers("546f4")).to eq("El codigo no deberia tener letras")
    end
    it 'devuelve  el codigo por defecto' do
        @juego=Game.new()
        expect(@juego.getCode()).to eq(1234)
    end
    it 'devuelve intentos por defecto' do
        @juego=Game.new()
        expect(@juego.getIntentos()).to eq(10)
    end
    it 'devuelve 16 intentos' do
        @juego=Game.new()
        @juego.setIntentos(16)
        expect(@juego.getIntentos()).to eq(16)
    end
    it 'devuelve los intentos tras jugar' do
        @user=User.new("Juan")
        @juego=Game.new(@user,15,187)
        @juego.play(129)
        expect(@juego.getIntentos).to eq(14)
    end

    it 'devuelve 0 intentos tras rendirse' do
        @juego=Game.new()
        @juego.setIntentos(16)
        @juego.rendirse()
        expect(@juego.getIntentos()).to eq(0)
    end
    it 'devuelve la cantidad de digitos del codigo por defecto' do
        @juego=Game.new()
        expect(@juego.sizeOfCode()).to eq("4")
    end
    it 'devuelve la cantidad de digitos del codigo' do
        @juego=Game.new()
        @juego.setCode(129)
        expect(@juego.sizeOfCode()).to eq("3")
    end
    it 'devuelve el tipo de jugador que es' do
        @user=User.new()
        @user.setTipo(1)
        expect(@user.getTipo()).to eq(1)
    end

    
    it 'devuelve el nickname que se le creo' do
        @user=User.new()
        @user.setNickname("NickName")
        expect(@user.getNickname()).to eq("NickName")
    end

    it 'devuelve el tamaño del nickname que se le creo manualmente vacio' do
        @user=User.new("Juan")
        @user.setNickname("")
        expect(@user.getNickname().size).to eq(6)
    end

    it'devolver numero de intento establecidos en este caso 15' do 
        @juego=Game.new()
        @juego.setIntentos(15)
        expect(@juego.getIntentos()).to eq(15)
    end

    it'devolver email por defecto' do 
        @user=User.new()
        expect(@user.getEmail()).to eq("")
    end

    it'devolver email prueba@hotmail.com' do 
        @user=User.new()
        @user.setEmail("prueba@hotmail.com")
        expect(@user.getEmail()).to eq("prueba@hotmail.com")
    end

    it'devolver password por defecto' do 
        @user=User.new()
        expect(@user.getPassword()).to eq("")
    end
    it'devolver password  prueba123' do 
        @user=User.new()
        @user.setPassword("prueba123")
        expect(@user.getPassword()).to eq("prueba123")
    end
    it 'devolver password aleatoria' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setRandomCode()
        expect(@juego.sizeOfCode()).to eq("4")
    end
    it 'devolver password aleatoria tam6' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setRandomCodeSix()
        expect(@juego.sizeOfCode()).to eq("6")
    end
    it 'devolver password aleatoria tam8' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        @juego.setRandomCodeEight()
        expect(@juego.sizeOfCode()).to eq("8")
    end
    it 'comprobacion de codigo de colores correcta' do
        @user=User.new("Juan")
        @juego=Game.new(@user,15)
        @cod=@juego.setCodeColorsToInt("RYBGWPOFSL")
        @juego.setCode(@cod)
        expect(@juego.getCode()).to eq(1234567890)
    end
    it 'comprobacion de codigo de colores correcta2' do
        @user=User.new("Juan")
        @juego=Game.new(@user,15)
        @cod=@juego.setCodeColorsToInt("SOBOLORO")
        @juego.setCode(@cod)
        expect(@juego.getCode()).to eq(97370717)
    end
    it 'comprobacion de codigo de colores correcta3' do
        @user=User.new("Juan")
        @juego=Game.new(@user,15)
        @cod=@juego.setCodeColorsToInt("FFFFFFFF")
        @juego.setCode(@cod)
        expect(@juego.getCode()).to eq(88888888)
    end

    it 'comprobacion de codigo enteros a colores' do
        @user=User.new("Juan")
        @juego=Game.new(@user,15,1234567890)
        @contrasena=@juego.getCodeIntToColors()        
        expect(@contrasena).to eq("RYBGWPOFSL")
    end
    it 'devolver invitacion' do
        @user=User.new("Juan")
        @juego=Game.new(@user)
        expect(@juego.getInvitationCode().size).to eq(4)
    end
    
end