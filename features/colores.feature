Feature:

Como jugador anfitrión
Quiero insertar un código
Para que el otro jugador lo adivine

Scenario: 

Given Ingreso a la pagina para ingresar un codigo de colores
When Lleno el campo "codigo" con el valor "RWGY"
And Presiono el boton para ingresar el codigo "set"
Then Deberia ver la pagina para adivinar 
