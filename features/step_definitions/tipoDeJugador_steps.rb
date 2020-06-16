Given('ingreso a la pagina para seleccionar el tipo de jugador') do
    visit '/menuNumber'
  end
  
  When('Presiono el boton para ser el jugador adivinador {string}') do |boton|
    click_button(boton)
  end
  
  Then('Deberia ver un mensaje para adivinar el codigo {string}') do |string|
    last_response.body.should =~ /#{string}/m
  end