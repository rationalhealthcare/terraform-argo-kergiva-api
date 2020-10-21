variable "database_host" {
  type = string
}
variable "database_port" {
  type = number
}
variable "database_username" {
  type = string
}
variable "database_password" {
  type = string
}
variable "database_name" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}
variable "cluster_cert_issuer" {
  type = string
}
variable "cluster_ingress_class" {
  type = string
}
variable "cluster_argocd_namespace" {
  type = string
}

variable "project_name" {
  type = string
}
variable "domain_name" {
  type = string
}
variable "namespace" {
  type        = string
  description = "The namespace that this kergiva-api deployment will reside in"
}
variable "name" {
  type    = string
  default = "kergiva-api"
}
variable "chart_repo_url" {
  type    = string
  default = "https://raw.githubusercontent.com/turnbros/helm-generic/main/"
}
variable "chart_name" {
  type    = string
  default = "kergiva-org"
}
variable "chart_version" {
  type    = string
  default = "0.1.3"
}
variable "replicas" {
  type    = number
  default = 1
}
variable "image_repo" {
  type    = string
  default = "docker.pkg.github.com"
}
variable "image_name" {
  type    = string
  default = "rationalhealthcare/myapi/kergiva-api"
}
variable "image_tag" {
  type    = string
  default = "latest"
}
variable "image_pull_secret" {
  type = string
}
variable "labels" {
  type    = map(string)
  default = {}
}