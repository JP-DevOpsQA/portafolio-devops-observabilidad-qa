#!/bin/bash
# Verificar si el directorio existe, si no, lo crea
DIRECTORIO="/mnt/c/Users/pedro/Desktop/PORTAFOLIO monitorizacion"
ARCHIVO="optimización_almacenamiento_prometheus.md"

# Crear el directorio si no existe
if [ ! -d "$DIRECTORIO" ]; then
  mkdir -p "$DIRECTORIO"
fi

# Crear el archivo con el contenido
cat << EOT > "$DIRECTORIO/$ARCHIVO"
# Optimización del Almacenamiento en Prometheus

## Verificación del Almacenamiento Actual

Se ha verificado el uso de almacenamiento actual en Prometheus utilizando el siguiente comando:

\`\`\`bash
du -sh /home/pedro/Downloads/prometheus-2.54.1.linux-amd64/data
\`\`\`

El almacenamiento utilizado fue **3.1 MB** en este momento, lo que refleja un uso optimizado debido a la configuración adecuada de la retención de datos.

## Ajuste de la Retención de Datos

Hemos ajustado la configuración de retención de datos a **15 días** para evitar el uso excesivo de almacenamiento.

\`\`\`yaml
storage:
  tsdb:
    retention.time: 15d  # Ajuste de retención de datos a 15 días
\`\`\`

Este ajuste asegura que los datos se mantendrán durante 15 días antes de ser eliminados para liberar espacio.

## Verificación de Bloques de Datos

También se ha verificado la estructura de los bloques de datos:

\`\`\`bash
ls -lh /home/pedro/Downloads/prometheus-2.54.1.linux-amd64/data
\`\`\`

Estos son los bloques actuales en el sistema que están utilizando espacio de almacenamiento.

## Conclusión

El almacenamiento de Prometheus ha sido optimizado con un uso eficiente del disco gracias a la configuración de retención de datos. Esto asegura que Prometheus no consuma más espacio del necesario mientras mantiene los datos críticos para análisis.
EOT

echo "Archivo optimización_almacenamiento_prometheus.md creado en el directorio: $DIRECTORIO"
