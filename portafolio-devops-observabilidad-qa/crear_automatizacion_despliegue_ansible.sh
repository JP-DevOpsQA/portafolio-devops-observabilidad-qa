#!/bin/bash
# Script para crear la documentación de automatización del despliegue con Ansible
DIRECTORIO="/mnt/c/Users/pedro/Desktop/PORTAFOLIO monitorizacion"
ARCHIVO="automatizacion_despliegue_prometheus_grafana_ansible.md"

# Crear el archivo con el contenido
cat <<EOT > "$DIRECTORIO/$ARCHIVO"
# Automatización del Despliegue de Prometheus y Grafana con Ansible

## Descripción General

En esta sección, documentamos cómo automatizar el despliegue de Prometheus y Grafana utilizando Ansible. Esta automatización permite gestionar múltiples servidores de manera eficiente y asegura la consistencia en la configuración.

## Estructura del Playbook de Ansible

Hemos creado un playbook de Ansible para instalar y configurar Prometheus y Grafana en los servidores. A continuación, se muestra un ejemplo de la estructura del playbook:

\`\`\`yaml
---
- name: Desplegar Prometheus y Grafana
  hosts: all
  become: yes
  tasks:
    - name: Instalar Prometheus
      apt:
        name: prometheus
        state: present

    - name: Instalar Grafana
      apt:
        name: grafana
        state: present

    - name: Configurar Prometheus
      template:
        src: templates/prometheus.yml.j2
        dest: /etc/prometheus/prometheus.yml

    - name: Configurar Grafana
      template:
        src: templates/grafana.ini.j2
        dest: /etc/grafana/grafana.ini

    - name: Reiniciar servicios
      service:
        name: "{{ item }}"
        state: restarted
      with_items:
        - prometheus
        - grafana
\`\`\`

## Beneficios de la Automatización

La automatización del despliegue de Prometheus y Grafana con Ansible ofrece los siguientes beneficios:

1. **Despliegue rápido y eficiente en múltiples servidores.**
2. **Consistencia en la configuración.**
3. **Facilidad para aplicar actualizaciones y cambios de configuración.**

## Conclusión

Al automatizar el despliegue de Prometheus y Grafana, hemos simplificado la administración de estas herramientas en entornos productivos. Ansible nos permite escalar de manera eficiente y mantener la infraestructura bajo control.
EOT

echo "Archivo automatizacion_despliegue_prometheus_grafana_ansible.md creado en el directorio: $DIRECTORIO"
