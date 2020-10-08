locals {
  automated_self_heal = true
  automated_prune     = true
  service_name     = "kergiva-api"
  service_port     = 80
  service_protocol = "TCP"
  service_scheme = "http"
  labels = merge(var.labels, {
    "app.kubernetes.io/tier" = "api"
  })
}
