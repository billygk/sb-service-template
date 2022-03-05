#Legacy instalation method

## Rabbit RBAC (rabbit-secret.yaml)
First thing we will create a service account called rabbitmq where our rabbitmq instance is going to be running as.
We're also going to need permission so that these instances can make a call to the kubernetes api, the kubernetes discovery plugin for rabbitmq requires access to the api in order to discover other peers on the network, so in order
to allow that we're going to need to create a role rabbitmq and we give it access to: list, get and watch endpoints.
We also need to create a role binding to hook up that
service account to the role and we do this in the rabbit's namespace.

## Rabbit Authentication (rabbit-secret.yaml)
Rabbit nodes talk to each other through an erlang cookie, all nodes must share the same cookie.

## Rabbit Discovery mechanism (rabbit-configmap.yaml)
Here we enable plugins:
  - rabbitmq_federation: federate and synchronize queues and messages across different instances
  - rabbitmq_management: user interface and the dashboard
  - rabbitmq_peer_discovery_k8s: this plugin is essential for the discovery mechanisms to work

## Rabbit Statefull set and deploymient (rabbit-statefulset.yaml)
Here we create statefull pods naming conventions and pod deployment.
```
serviceAccountName: rabbitmq
```
This is very important is where we define an account name to be running as, this links the previous rbac permissions. 
Other important point is that volumes must be writable, by default the are ReadOnly


## Namespace

```
kubectl create ns rabbits
```

## Storage Class

```
kubectl get storageclass
NAME                 PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
standard (default)   rancher.io/local-path   Delete          WaitForFirstConsumer   false                  84s
```

## Deployment

```
kubectl apply -n rabbits -f rabbit-rbac.yaml
kubectl apply -n rabbits -f rabbit-secret.yaml
kubectl apply -n rabbits -f rabbit-configmap.yaml
kubectl apply -n rabbits -f rabbit-statefulset.yaml
```

