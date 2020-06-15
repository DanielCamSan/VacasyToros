Given('ingreso a la pagina para registrar mis datos') do
    visit '/RegisterName'
  end
  
  When('Registro mi nombre en el campo {string} con el valor {string}') do |campo, valor|
    fill_in(campo, :with => valor)
  end
  
  When('Registro mi nickname en el campo {string} con el valor {string}') do |campo, valor|
    fill_in(campo, :with => valor)
  end

  When('Presiono el boton de registrarse {string}') do |boton|
    click_button(boton)
  end
  
  Then('Deberia ver un mensaje {string}') do |string|
    last_response.body.should=~/#{string}/m
  end