# Documentación de la Configuración de Prometheus

Configuración inicial de Prometheus

Prometheus es una herramienta de monitoreo que recolecta métricas de varios sistemas en tiempo real. En esta configuración inicial, hemos realizado los siguientes ajustes:

**Tiempo de retención:**

Hemos ajustado el tiempo de retención de los datos a 30 días mediante la opción `--storage.tsdb.retention.time=30d`.

Comando utilizado:

```bash
./prometheus --config.file=prometheus.yml --storage.tsdb.retention.time=30d &

Frecuencia de scraping:

Se ha cambiado la frecuencia de scraping a 30 segundos en el archivo prometheus.yml:

global:  
  scrape_interval: 30s

Verificación:

Para verificar que la configuración es correcta, se accedió a Prometheus en el navegador mediante la URL http://localhost:9090. Se pudo comprobar que las métricas se estaban recogiendo correctamente y el cambio de retención se aplicó.
