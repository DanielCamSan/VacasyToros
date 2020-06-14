Feature:
    Como jugador anfitrión
    Quiero insertar un código
    Para que el otro jugador lo adivine

Scenario: 
    Given ingreso a la pagina para ingresar un codigo
    When lleno el campo "codigo" con el valor "12345"
    And presiono el boton "set"
    Then deberia ver la pagina para ingresar el numero de intentos
    
