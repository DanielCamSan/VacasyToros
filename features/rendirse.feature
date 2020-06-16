Feature: 

Como jugador que adivina el código
Quiero terminar el juego
Para saber si adivine el código o no

Scenario: 

Given  Ingreso a la pagina para ingresar para adivinar el codigo
When Presiono el boton de rendirse "rendirse"
Then Deberia ver un mensaje que diga "¡PERDISTE!"


