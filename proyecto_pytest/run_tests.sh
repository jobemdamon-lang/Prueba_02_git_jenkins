#!/bin/bash

echo "Iniciando ejecución de pruebas en Jenkins ..."

# Crear entorno virtual si no existe
if [ ! -d "venv" ]; then 
    echo "Entorno virtual no encontrado. Creándolo ..."
    python3 -m venv venv
fi

# Activar entorno virtual
if [ -f "venv/bin/activate" ]; then 
    source venv/bin/activate
else 
    echo "Error: No se pudo activar el entorno virtual."
    exit 1
fi

echo "Instalando dependencias ..."
pip install --upgrade pip
pip install -r requirements.txt

mkdir -p reports

echo "Ejecutando pruebas con pytest ..."
pytest test/ \
--junitxml=reports/test-results.xml \
--html=reports/test-results.html \
--self-contained-html

echo "Pruebas finalizadas. Resultados en reports/"
