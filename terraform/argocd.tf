data "kustomization_build" "argocd" {
  path = "../eks-infra/k8s-bootstrap/argocd/bootstrap"
}

resource "kustomization_resource" "argocd" {
  for_each = data.kustomization_build.argocd.ids
  manifest = data.kustomization_build.argocd.manifests[each.value]
}
