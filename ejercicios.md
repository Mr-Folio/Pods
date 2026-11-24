# Ejercicios de Pods en Kubernetes

## Ejercicio 1: Despliegue, inspección y acceso interactivo a un Pod

1. Crea un archivo llamado `pod-apache.yaml` que defina un Pod con las siguientes características:
   - **Nombre del Pod**: `pod-apache`
   - **Etiquetas (`labels`)**: `app: apache` y `entorno: practicas`
   - **Contenedor**: nombre `contenedor-apache`, imagen `httpd:2.4` y `imagePullPolicy: IfNotPresent`.
2. Aplica el manifiesto en el clúster con `kubectl apply`.
3. Comprueba que el Pod está en estado `Running` y muestra sus detalles completos (`kubectl get` y `kubectl describe`).
4. Accede de forma interactiva al contenedor con `/bin/bash`, comprueba la versión del sistema operativo (`/etc/os-release`) y verifica que el proceso de Apache está en ejecución.

---

## Ejercicio 2: Redirección de puertos (`port-forward`) y análisis de logs

1. Partiendo del Pod `pod-nginx` definido en [pod.yaml](pod.yaml) (o del Pod del ejercicio anterior):
   - Inicia una redirección de puertos para exponer el puerto `80` del Pod en el puerto local `8080` de tu máquina.
2. Abre un navegador (o usa `curl`) y realiza al menos dos peticiones:
   - Una a la ruta principal `/` (`http://localhost:8080/`).
   - Otra a una ruta inexistente, por ejemplo `/no-existe` (`http://localhost:8080/no-existe`).
3. Detén la redirección de puertos y consulta los logs del Pod con `kubectl logs`.
4. Identifica en la salida de los logs los códigos de estado HTTP (`200` y `404`) correspondientes a las peticiones realizadas.
