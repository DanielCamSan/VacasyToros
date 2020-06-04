require 'User.rb'
require 'Game.rb'
RSpec.describe "Creacion" do
    it 'devuelve un nombre un nombre por defecto si se creo correctamente sin indicar el nombre' do
        @user=User.new
        expect(@user.getName()).to eq("Guest")
    end
    it 'ectamente sin indicar el nombre' do
        @user=User.new("")
        expect(@user.getName()).to eq("")
    end
    it 'devuelve nombre que ingresa ' do
        @user=User.new('JUAN')
        expect(@user.getName()).to eq('JUAN')
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
    it 'devuelve 3vacas' do
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
end