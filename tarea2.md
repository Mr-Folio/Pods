# Tarea 2: Pod multicontenedor con volumen compartido (`emptyDir`)

En esta tarea se trabaja con un Pod que ejecuta **dos contenedores** compartiendo un mismo volumen `emptyDir`, definido en [pod_multicontenedor.yaml](pod_multicontenedor.yaml):

- **`contenedor1`** (`nginx`): monta el volumen `html` en `/usr/share/nginx/html`.
- **`contenedor2`** (`debian`): monta el mismo volumen `html` en `/html` y ejecuta un bucle que escribe la fecha actual cada segundo en `/html/index.html`.

---

## 1. Despliegue y comprobación del Pod multicontenedor

```bash
kubectl apply -f pod_multicontenedor.yaml
kubectl get pods
kubectl describe pod/pod-multicontenedor
```

**Explicación:**
- `kubectl apply -f pod_multicontenedor.yaml`: Crea el Pod `pod-multicontenedor` con sus dos contenedores y el volumen compartido `html`.
- `kubectl get pods`: Muestra el estado del Pod (`READY 2/2` cuando ambos contenedores están listos).
- `kubectl describe pod/pod-multicontenedor`: Muestra los detalles de ambos contenedores (`contenedor1` y `contenedor2`), el volumen `emptyDir` y los eventos de arranque.

---

## 2. Acceso interactivo a cada contenedor (`-c`)

```bash
kubectl exec pod/pod-multicontenedor -c contenedor1 -it -- /bin/bash
kubectl exec pod/pod-multicontenedor -c contenedor2 -it -- /bin/bash
```

**Explicación:**
- Cuando un Pod tiene más de un contenedor, es necesario indicar con `-c <nombre_contenedor>` a cuál de ellos se quiere acceder.
- Dentro de `contenedor1` se puede comprobar `/usr/share/nginx/html/index.html` y dentro de `contenedor2` el archivo `/html/index.html`, verificando que ambos ven exactamente el mismo fichero compartido.

---

## 3. Redirección de puertos (`port-forward`) y verificación en navegador

```bash
kubectl port-forward pod/pod-multicontenedor 6060:80
```

**Explicación:**
- Redirige el puerto local `6060` al puerto `80` del contenedor Nginx (`contenedor1`) dentro del Pod `pod-multicontenedor`.
- Al abrir `http://localhost:6060` y recargar la página, se irán mostrando las líneas con la fecha y hora generadas cada segundo por `contenedor2`.

---

## 4. Consulta de logs de un contenedor específico

```bash
kubectl logs pod/pod-multicontenedor -c contenedor1
```

**Explicación:**
- `kubectl logs` con `-c contenedor1` muestra únicamente los registros de acceso y error generados por Nginx en `contenedor1`.
