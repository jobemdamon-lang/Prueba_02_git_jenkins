# Variables
- BUILD_NUMBER: Numero del build actual
- JOB_NAME: Nombre del job que estas ejecutando.
- WORKSPACE:  directorio donde jenkins almacena los archivos del job.
- GIT_COMMIT: hash del commit si el job usa git.


# Ejecutar un programa en python desde jenkins

Docker --> Contenedor ( Linux(Python)- Jenkins )
sudo docker exec -it --user root jenkins_prueba /bin/bash