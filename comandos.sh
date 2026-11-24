#!/usr/bin/env bash

# 1. Listar recursos e inspeccionar el Pod pod-nginx (describe.png)
kubectl get all
kubectl describe pod/pod-nginx

# 2. Abrir una shell interactiva en el Pod (bash-iterativa.png)
kubectl exec pod/pod-nginx -it -- /bin/bash
# Dentro del contenedor:
# cat /etc/os-release
# uname -a

# 3. Redirigir el puerto local 6060 al puerto 80 del Pod (pasarela.png)
kubectl port-forward pod/pod-nginx 6060:80

# 4. Consultar los logs del Pod (logs.png)
kubectl logs pod/pod-nginx
