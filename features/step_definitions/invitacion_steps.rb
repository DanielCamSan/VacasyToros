Given('ingreso a la pagina principal del juego para invitar personas') do
    visit '/InvitePeople'
  end
  
  
  Then('Deberia ver el mensaje {string} y el numero generado aleatoriamente') do |string|
    last_response.body.should=~/#{string}/m
  end