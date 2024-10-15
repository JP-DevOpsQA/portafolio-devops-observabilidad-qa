#!/bin/bash
# Script para crear la documentación de monitoreo de servicios críticos y alertas en Grafana
# Ubicación donde se guardará el archivo
DIRECTORIO="/mnt/c/Users/pedro/Desktop/PORTAFOLIO monitorizacion"
ARCHIVO="monitoreo_servicios_criticos_alertas.md"

# Crear el archivo con el contenido
cat <<EOT > "$DIRECTORIO/$ARCHIVO"



# Monitoreo de Servicios Críticos y Configuración de Alertas en Grafana

## Monitoreo de Servicios Críticos

En esta sección, hemos configurado Prometheus para monitorear los siguientes servicios críticos:

1. **Uso de CPU:** Monitoreo del uso de CPU en los servidores clave.
2. **Uso de Memoria:** Seguimiento del uso de RAM en los servicios esenciales.
3. **Disponibilidad del Servicio Web:** Aseguramos que los servicios web principales estén funcionando correctamente y sin caídas.

Estas métricas se visualizan en Grafana a través de paneles personalizados.

## Configuración de Alertas en Grafana

Para asegurarnos de que los servicios críticos estén siempre bajo control, hemos configurado alertas en Grafana que se activarán en los siguientes escenarios:

1. **Alerta de alto uso de CPU:** Se activa cuando el uso de CPU supera el 80%.
2. **Alerta de bajo espacio en disco:** Se activa cuando el espacio en disco es menor al 15%.
3. **Alerta de caída de servicios web:** Se dispara cuando un servicio no responde en un período de 1 minuto.

Las alertas se configuran visualmente en Grafana y envían notificaciones cuando se cumplen las condiciones.

\`\`\`yaml
# Ejemplo de configuración de alerta para el uso de CPU
alert:
  - alert: HighCPUUsage
    expr: node_cpu_seconds_total{mode="idle"} < 20
    for: 1m
    labels:
      severity: critical
    annotations:
      summary: "Uso de CPU alto en el servicio {{ \$labels.instance }}"
      description: "El uso de CPU ha superado el 80% por más de 1 minuto."
\`\`\`

## Notificaciones de Alertas

Las notificaciones se envían a través de:

1. **Correo Electrónico:** Las alertas críticas se envían a los correos electrónicos configurados.
2. **Slack:** Se ha integrado Grafana con Slack para recibir alertas en tiempo real en un canal específico.

## Conclusión

El monitoreo de los servicios críticos y la configuración de alertas aseguran que el sistema esté bajo control. Las alertas se activan automáticamente cuando se detectan problemas, y las notificaciones permiten una respuesta rápida.
EOT

echo "Archivo monitoreo_servicios_criticos_alertas.md creado en el directorio: $DIRECTORIO"
