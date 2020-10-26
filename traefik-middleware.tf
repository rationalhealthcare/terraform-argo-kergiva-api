resource "k8s_manifest" "ingress_route" {
  content = yamlencode(local.ingress_route_middleware)
}
locals {
  ingress_route_middleware = {
    apiVersion = "traefik.containo.us/v1alpha1"
    kind = "Middleware"
    metadata = {
      name = "kergiva-api-replace-path"
      namespace = var.namespace
      labels = var.labels
    }
    spec = {
      replacePath = {
        path = "/"
      }
    }
  }
}