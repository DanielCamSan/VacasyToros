Given('ingreso a la pagina para adivinar el codigo') do
  visit '/SelectTypeGuesser'
end

When('completo el campo {string} con el valor {string}') do |campo, valor|
  fill_in(campo, :with => valor.to_i)
end

When('hago click en el boton {string}') do |boton|
  click_button(boton)
end

Then('deberia ver el mensaje {string}') do |string|
  last_response.body.should=~/#{string}/m
end

#####################################################Ganar Juego#############################################################################

Given('ingreso a la pagina para adivinar el codigo y ganar') do
  visit '/SelectTypeGuesser'
end

When('completo el campo {string} con el codigo {string}') do |campo, valor|
  fill_in(campo, :with => valor.to_i)
end

When('presiono en el boton {string}') do |boton|
  click_button(boton)
end

Then('deberia poder ver el mensaje {string}') do |string|
  last_response.body.should=~/#{string}/m
end