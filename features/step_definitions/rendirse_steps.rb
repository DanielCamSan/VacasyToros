Given('Ingreso a la pagina para ingresar para adivinar el codigo') do
    visit '/SelectTypeGuesser'
  end
  
  When('Presiono el boton de rendirse {string}') do |boton|
    click_button(boton)
  end
  
  Then('Deberia ver un mensaje que diga {string}') do |string|
    last_response.body.should=~/#{string}/m
  end