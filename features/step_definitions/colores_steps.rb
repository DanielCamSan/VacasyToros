Given('Ingreso a la pagina para ingresar un codigo de colores') do
    visit '/codeDificultyColorPer' , :post, "codigo=RWGY"
  end
  
  When('Lleno el campo {string} con el valor {string}') do |campo, valor|
    fill_in(campo, :with => valor)
  end
  
  When('Presiono el boton para ingresar el codigo {string}') do |boton|
    click_button(boton)
  end
  
  Then('Deberia ver la pagina para adivinar') do
    visit '/setCodeColor'
  end