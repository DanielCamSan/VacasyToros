Feature: 

Como persona que le gusta jugar
Quiero ingresar a la página
Para poder jugar

Scenario: 

Given Ingreso a la pagina inicial del juego 
When Presiono el boton para ingresar por una cuenta "submit"
And Registro mi correo en el campo "email" con el valor "victorhm2011@gmail.com"
And Registro mi contrasena en el campo "password" con el valor "dfqij17516"
And Presiono el boton de registrarse "submit"
Then Deberia poder entrar al juego y ver el mensaje "Enter to the Game"

