Feature:

Como jugador anfitrión
Quiero definir el tamaño del código que tendrá que adivinar el otro jugador
Para saber el grado de dificultad

Scenario: 

Given ingreso a la pagina para seleccionar el grado de dificultad
When Presiono en el boton "Easy"
Then me manda a la pagina de dificultad basica y deberia poder ver el mensaje "Enter a code of size 4"

Scenario: 

Given Ingreso a la pagina para seleccionar el grado de dificultad
When Hago click en el boton "Medium"
Then Me manda a la pagina de dificultad media y deberia poder ver el mensaje "Enter a code of size 6"

Scenario: 

Given Ingreso a la pagina para seleccionar el grado de Dificultad
When Hago presion en el boton "Hard"
Then Me manda a la pagina de dificultad dificil y deberia poder ver el mensaje "Enter a code of size 8"