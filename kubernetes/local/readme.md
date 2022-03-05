# Kubernetes configuration scripts for local 

## Using "kind"

source: https://kind.sigs.k8s.io/docs/user/ingress/

1- Create cluster using configuration file with preparations for ingress

```
kind create cluster --config=kind_local_k8s.yaml
```

2- Manifest containing specific patches for ingress controller
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
```

3- Wait until ingress controller is ready
```
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
```

4- Deploy some example pods to test ingress 
```
kubectl apply -f test-ingress.yaml
```

5- Check all is working
```
# should output "foo"
curl localhost/foo
# should output "bar"
curl localhost/bar
```
