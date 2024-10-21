# portafolio-devops-observabilidad-qa
Portafolio de DevOps, Observabilidad, QA, y otros proyectos relevantes. Incluye configuraciones de Prometheus, ELK Stack, Grafana, y ejemplos de automatización.

## Archivos principales:
- **automatizacion_despliegue_prometheus_grafana_ansible.md**: Detalles de la automatización del despliegue utilizando Ansible.
- **crear_explicacion_grafica.sh**: Script que genera la explicación de la gráfica `prometheus_up_metric.png`.
- **crear_monitoreo_alertas.sh**: Configuración para monitoreo y alertas en Prometheus.
- **documentacion_prometheus.md**: Documentación sobre la configuración básica de Prometheus.

## Gráfica de "prometheus_up_metric.png"

Esta gráfica muestra la métrica `up` en Prometheus, que indica si las instancias monitoreadas están activas o inactivas. Es una métrica crítica para monitorear la disponibilidad de los servicios en un entorno de observabilidad. La imagen está disponible como `prometheus_up_metric.png` y se puede utilizar para visualizar rápidamente el estado de los targets en Prometheus.
## Optimización de Prometheus

### Ajuste del intervalo de scraping
Hemos ajustado el `scrape_interval` en el archivo `prometheus.yml` para optimizar la frecuencia de recopilación de métricas. El valor anterior era de 15 segundos, y se ha ajustado a 30 segundos para mejorar el rendimiento del sistema sin perder precisión en las métricas.

Configuración actual:
```yaml
scrape_interval: 30s
```

### Ajuste de la retención de datos
La retención de datos se ha ajustado para que Prometheus mantenga las métricas durante 30 días. Esto se ha logrado modificando el archivo del servicio de Prometheus para incluir el parámetro `--storage.tsdb.retention.time=30d`.

Configuración del servicio:
```bash
ExecStart=/home/pedro/Downloads/prometheus-2.54.1.linux-amd64/prometheus \
  --config.file=/home/pedro/Downloads/prometheus-2.54.1.linux-amd64/prometheus.yml \
  --storage.tsdb.retention.time=30d
```

### Verificación
Se ha verificado la retención de datos utilizando el siguiente comando, confirmando que los cambios se aplicaron correctamente:

```bash
curl http://localhost:9090/api/v1/status/flags | grep retention
```

Resultado:
```json
"storage.tsdb.retention.time": "30d"
```

