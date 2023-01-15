## :hammer: Work in progress :hammer:

## ArgoCD in EKS with Terraform


### To deploy

```bash
terraform init
```

### Checkout the plan

```bash
terraform plan --out=plan.out
```
![plan.png](docs%2Fimages%2Fplan.png)

### Apply the plan
```bash
terraform apply plan.out
```

### Configure kubctl to access the cluster

```bash
export export KUBECONFIG=kubeconfig_argocd-eks-terraform
```

### See the pods

```bash
kubectl -n kube-system get po
```

![kubectl_get_po.png](docs%2Fimages%2Fkubectl_get_po.png)

### See all resources in the cluster

```bash
kubectl -n argocd get all
```

![all_resources.png](docs%2Fimages%2Fall_resources.png)

### Get password (user = admin)

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

![password.png](docs%2Fimages%2Fpassword.png)

### Port fordward
```bash
kubectl -n argocd port-forward service/argocd-server 8080:80
```

### Self managed ArgoCD screenshot
![argocd.png](docs%2Fimages%2Fargocd.png)

### Destroy deployment

```bash
terraform destroy
```
