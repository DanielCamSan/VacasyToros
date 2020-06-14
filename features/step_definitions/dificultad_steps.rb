#Easy

Given('ingreso a la pagina para seleccionar el grado de dificultad') do
    visit '/SelectTypeGenerator'
  end
  
  When('Presiono en el boton {string}') do |boton|
    click_button(boton)
  end
  
  Then('me manda a la pagina de dificultad basica y deberia poder ver el mensaje {string}') do |string|
    last_response.body.should=~/#{string}/m
  end

#Medium

Given('Ingreso a la pagina para seleccionar el grado de dificultad') do
    visit '/SelectTypeGenerator'
  end
  
  When('Hago click en el boton {string}') do |boton|
    click_button(boton)
  end
  
  Then('Me manda a la pagina de dificultad media y deberia poder ver el mensaje {string}') do |string|
    last_response.body.should=~/#{string}/m
  end

#Hard

Given('Ingreso a la pagina para seleccionar el grado de Dificultad') do
    visit '/SelectTypeGenerator'
  end
  
  When('Hago presion en el boton {string}') do |boton|
    click_button(boton)
  end
  
  Then('Me manda a la pagina de dificultad dificil y deberia poder ver el mensaje {string}') do |string|
    last_response.body.should=~/#{string}/m
  end


