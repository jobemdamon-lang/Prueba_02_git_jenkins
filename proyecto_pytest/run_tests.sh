#!/bin/bash


echo "Iniciando ejecución de pruebas en Jenkins ..."

# Verificar si el entorno virtual existe
if [! -d "venv" ]; then 
    echo " Entorno virtual no encontrado. Creándolo ..."
    python3 -m venv venv
fi

# Activar el entorno virtual correctamente

if [ -f "venv/bin/activate"]; then 
    source venv/bin/activate
elif [ -f "venv/bin/activate" ]; then # Para linux
    source venv/bin/activate
else 
    echo " Error: No se pudo activar el entorno virtual."
    exit 1
fi



# Verificamos si 'pip' esta instalado correctamente
echo "instalando dependencias ..."
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages


mkdir -p reports

# Ejecutar las pruebas
echo "ejecutando pruebas con pytest"
venv/bin/python pytest test/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas. resultados en reports/"