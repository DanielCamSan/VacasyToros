Given('Ingreso a la pagina inicial del juego') do
    visit '/'
  end
  
  When('Presiono el boton para ingresar por una cuenta {string}') do |boton|
    click_button(boton)
  end
  
  When('Registro mi correo en el campo {string} con el valor {string}') do |campo, valor|
    fill_in(campo, :with => valor)
  end
  
  When('Registro mi contrasena en el campo {string} con el valor {string}') do |campo, valor|
    fill_in(campo, :with => valor)
  end
  
  Then('Deberia poder entrar al juego y ver el mensaje {string}') do |string|
    last_response.body.should=~/#{string}/m
  end