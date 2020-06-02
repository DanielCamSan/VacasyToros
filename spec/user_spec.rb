require 'User.rb'
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
   
end