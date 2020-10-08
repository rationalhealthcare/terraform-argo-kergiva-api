
module "kergiva_api" {
  source = "github.com/turnbros/terraform-octal-http-application"

  cluster_endpoint         = var.cluster_endpoint
  cluster_cert_issuer      = var.cluster_cert_issuer
  cluster_ingress_class    = var.cluster_ingress_class
  cluster_argocd_namespace = var.cluster_argocd_namespace

  project                 = var.project_name
  name                    = var.name
  namespace               = var.namespace
  repo_url                = var.chart_repo_url
  chart_name              = var.chart_name
  chart_version           = var.chart_version
  release_name            = var.name
  application_domain_name = var.domain_name
  automated_self_heal     = local.automated_self_heal
  automated_prune         = local.automated_prune
  helm_values = yamldecode(templatefile("${path.module}/values.yml", {
    replicas = var.replicas
    image_repo = var.image_repo
    image_name = var.image_name
    image_tag = var.image_tag
    image_pull_secret= var.image_pull_secret
    service_name     = local.service_name
    service_port     = local.service_port
    service_protocol = local.service_protocol
  }))
  route_rules = [
    {
      match_rule = "Host(`${var.domain_name}`)"
      services = [
        {
          namespace = var.namespace
          name      = local.service_name
          port      = local.service_port
          scheme    = local.service_scheme
        }
      ]
    }
  ]
  labels = local.labels
}