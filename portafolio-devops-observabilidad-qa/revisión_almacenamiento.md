# Revisión y Optimización del Almacenamiento en Prometheus

## Ajuste de la Retención de Datos

Verificamos y ajustamos la retención de datos para optimizar el uso de almacenamiento en Prometheus. Configuramos la retención en **15 días**.

```bash
ExecStart=/home/pedro/Downloads/prometheus-2.54.1.linux-amd64/prometheus --config.file=/home/pedro/Downloads/prometheus-2.54.1.linux-amd64/prometheus.yml
```

Esto permite que Prometheus almacene datos por un período de 15 días antes de eliminarlos para optimizar el uso de almacenamiento.

## Verificación del Almacenamiento

Utilizamos los siguientes comandos para revisar el uso actual de almacenamiento y la estructura de los bloques:

```bash
du -sh /home/pedro/Downloads/prometheus-2.54.1.linux-amd64/data
ls -lh /home/pedro/Downloads/prometheus-2.54.1.linux-amd64/data
```

El almacenamiento utilizado fue **3.1 MB** en este momento. También listamos los bloques de datos:

Estos son los bloques actuales en el sistema:
