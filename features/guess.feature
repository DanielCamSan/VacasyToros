Feature:
Como jugador que adivina el código
Quiero insertar el código
Para ver las respuesta

Scenario:

Given ingreso a la pagina para adivinar el codigo
When completo el campo "guessCode" con el valor "1243"
And hago click en el boton "guessButton"
Then deberia ver el mensaje "2 toros y 1 vacas"

Scenario:

Given ingreso a la pagina para adivinar el codigo y ganar
When completo el campo "guessCode" con el codigo "1542"
And presiono en el boton "guessButton"
Then deberia poder ver el mensaje "¡GANASTE!"



