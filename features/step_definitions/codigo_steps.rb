Given('ingreso a la pagina para ingresar un codigo') do
    visit '/codeDificultyPer', :post, "codigo=1234"
end
  
When('lleno el campo {string} con el valor {string}') do |campo, valor|
    fill_in(campo, :with => valor)
end

When('presiono el boton {string}') do |boton|
    click_button(boton)
  end

  Then('deberia ver la pagina para ingresar el numero de intentos') do
    visit '/setCode'
  end
  
  