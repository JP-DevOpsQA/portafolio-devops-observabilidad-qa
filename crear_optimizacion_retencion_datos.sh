#!/bin/bash
# Script para crear la documentación de optimización de la retención de datos en Prometheus
DIRECTORIO="/mnt/c/Users/pedro/Desktop/PORTAFOLIO monitorizacion"
ARCHIVO="optimizacion_retencion_datos_prometheus.md"

# Crear el archivo con el contenido
cat <<EOT > "$DIRECTORIO/$ARCHIVO"
# Optimización de la Retención de Datos en Prometheus

## Configuración de la Retención de Datos

En Prometheus, hemos ajustado la retención de datos para que los datos históricos se mantengan solo durante el período necesario. Esto permite optimizar el uso de espacio en disco sin perder información importante.

### Cambios realizados en la configuración:

- **retention.time:** Hemos ajustado el tiempo de retención de datos a 15 días para equilibrar la necesidad de datos históricos con el uso de espacio en disco.

\`\`\`yaml
storage:
  tsdb:
    retention.time: 15d  # Retención de datos ajustada a 15 días
\`\`\`

## Beneficios de la Optimización

Al optimizar la retención de datos, hemos logrado:

1. **Reducción en el uso de espacio en disco.**
2. **Mejora en el rendimiento del sistema.**
3. **Asegurar que solo se almacenen los datos más relevantes.**

## Monitorización de la Capacidad de Almacenamiento

Hemos configurado alertas que monitorean el uso del espacio en disco, lo que nos permite actuar antes de que se alcance el límite de almacenamiento.

\`\`\`yaml
alert:
  - alert: LowDiskSpace
    expr: node_filesystem_free_bytes / node_filesystem_size_bytes * 100 < 15
    for: 5m
    labels:
      severity: critical
    annotations:
      summary: "Bajo espacio en disco en el servidor {{ \$labels.instance }}"
      description: "El espacio libre en disco es menor al 15% por más de 5 minutos."
\`\`\`

## Conclusión

Con esta optimización, hemos asegurado que Prometheus funcione de manera eficiente y que los datos históricos se mantengan solo por el tiempo necesario. Además, las alertas configuradas permiten una monitorización constante del uso del espacio en disco.

EOT

echo "Archivo optimizacion_retencion_datos_prometheus.md creado en el directorio: $DIRECTORIO"
