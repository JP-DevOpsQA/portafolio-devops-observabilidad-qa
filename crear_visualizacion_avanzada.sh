#!/bin/bash
# Script para crear la documentación de la visualización avanzada en Grafana
DIRECTORIO="/mnt/c/Users/pedro/Desktop/PORTAFOLIO monitorizacion"
ARCHIVO="visualizacion_avanzada_grafana.md"

# Crear el archivo con el contenido
cat <<EOT > "$DIRECTORIO/$ARCHIVO"
# Visualización Avanzada en Grafana y Dashboards Personalizados

## Creación de Dashboards Personalizados

En esta sección, hemos creado dashboards personalizados en Grafana para visualizar las métricas más importantes. Los dashboards incluyen:

1. **Uso de CPU y Memoria:** Monitoreo del uso de CPU y RAM en tiempo real.
2. **Disponibilidad del Servicio Web:** Panel para verificar el estado de los servicios web en tiempo real.
3. **Espacio en Disco:** Seguimiento del uso de espacio en disco y alertas cuando se acerca al límite.

## Personalización de Dashboards

Cada dashboard ha sido personalizado con:

- **Gráficos de líneas y barras:** Para visualizar el comportamiento de las métricas a lo largo del tiempo.
- **Alertas visuales:** Indicadores que cambian de color cuando se alcanzan umbrales críticos.
- **Paneles interactivos:** Los paneles permiten hacer zoom y seleccionar intervalos de tiempo personalizados.

## Ejemplo de Configuración

A continuación, un ejemplo de cómo se configuró un panel para monitorear el uso de CPU:

\`\`\`yaml
{
  "panels": [
    {
      "type": "graph",
      "title": "Uso de CPU",
      "targets": [
        {
          "expr": "100 - (avg by (instance) (rate(node_cpu_seconds_total{mode='idle'}[5m])) * 100)",
          "legendFormat": "{{instance}}",
          "refId": "A"
        }
      ],
      "thresholds": [
        {
          "value": 80,
          "color": "orange"
        },
        {
          "value": 90,
          "color": "red"
        }
      ]
    }
  ]
}
\`\`\`

## Conclusión

Con esta configuración, hemos optimizado la visualización de las métricas clave en Grafana. Los dashboards personalizados proporcionan una vista clara del estado del sistema y permiten una rápida identificación de problemas.

EOT

echo "Archivo visualizacion_avanzada_grafana.md creado en el directorio: $DIRECTORIO"
