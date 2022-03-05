# EKS Cluster creation using scripts

### eksctl instructions

We use eksctl tools to create the EKS cluster based on a configuration yaml file _eks-config.yaml_

IAM permission: https://eksctl.io/usage/minimum-iam-policies/

```
eksctl create cluster -f eks-config.yaml
```

### **IMPORTANT Configuration**

For now this has to be done manually.

- VPC and subnets ids.
- region
- availability zones
- cluster name

---

### Adding user access EKS

Full documentation can be found: https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html

View configuration map
```
kubectl describe configmap -n kube-system aws-auth
```

Edit configuration map
```
kubectl edit -n kube-system configmap/aws-auth
```

Example file looks like:
```
# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.
#
apiVersion: v1
data:
  mapRoles: |
    - groups:
      - system:bootstrappers
      - system:nodes
      rolearn: arn:aws:iam::331758521346:role/eksctl-zinc-dev-cluster-nodegroup-NodeInstanceRole-1LQJQFEQRUC54
      username: system:node:{{EC2PrivateDNSName}}
  mapUsers: |
    - userarn: arn:aws:iam::331758521346:user/Oscar
      username: Oscar
      groups:
        - system:masters
kind: ConfigMap
metadata:
  creationTimestamp: "2021-01-31T21:27:44Z"
  name: aws-auth
  namespace: kube-system
  resourceVersion: "17238612"
  selfLink: /api/v1/namespaces/kube-system/configmaps/aws-auth
  uid: d8c88968-0099-4097-9cb7-a64cc8a38169
```

## TODO:

Complete this information that can be obtained from tf-vpc-eks output.

- VPC and subnets ids.
- region
- availability zones
- cluster name
