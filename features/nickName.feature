Feature: 

Como persona que desea jugar
Quiero registrar mis datos
Para poder guardar mis estadísticas y progreso

Scenario: 

Given ingreso a la pagina para registrar mis datos
When Registro mi nombre en el campo "name" con el valor "victor"
And Registro mi nickname en el campo "nickName" con el valor "victorhm2011"
And Presiono el boton de registrarse "submit"
Then Deberia ver un mensaje "Your name is: victor and your nick name is: victorhm2011"


