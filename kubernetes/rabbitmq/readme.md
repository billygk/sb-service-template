# RabbitMQ on Kubernetes

# RabbitMQ Cluster Operator for Kubernetes

https://www.rabbitmq.com/kubernetes/operator/operator-overview.html

RabbitMQ Cluster Kubernetes Operator automates provisioning, management, and operations of RabbitMQ clusters running on Kubernetes.

RabbitMQ Messaging Topology Operator manages RabbitMQ messaging topologies within a RabbitMQ cluster deployed via the RabbitMQ Cluster Kubernetes Operator.


## Install operator
```
kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml"
```

Once operator is installer we can deploy our cluster
## Deploy cluster
```
kubectl -n rabbitmq-system apply -f rabbit-operator-cluster.yaml
```

## RabbitMQ Credentials

The RabbitMQ username and password are configured as Kubernetes secrets during setup and configuration, access both the username and password as follows

```
Username:
kubectl -n rabbitmq-system get secret rabbit-queue-default-user -o jsonpath="{.data.username}" | base64 --decode

default_user_rsxQjGzUMv5aCTaZQnM

Password:
kubectl -n rabbitmq-system get secret rabbit-queue-default-user -o jsonpath='{.data.password}' | base64 --decode 

53U4Lv5SNS-61zw1hcDARGPVW6dPCgY3

```

## Access the RabbitMQ UI

```
kubectl port-forward --address 0.0.0.0 svc/rabbit-queue 15672
```

## Access the RabbitMQ UI using ingress

rabbit services run on its own namespace, in order to use ingress we need to create a proxy service like so:

rabbit-queue-service-proxy.yaml
```
kind: Service
apiVersion: v1
metadata:
  name: rabbit-queue-service-proxy
spec:
  type: ExternalName
  externalName: rabbit-queue.rabbitmq-system.svc.cluster.local
```

ingress-route.yaml (ingressClass portion)
```
...
spec:
  ingressClassName: nginx
  rules:
    - host: rabbit-mon.devplace.xyz
      http:
        paths:
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: rabbit-queue-service-proxy
              port:
                number: 15672
...
```
