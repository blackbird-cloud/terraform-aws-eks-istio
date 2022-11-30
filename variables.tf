variable "cluster_id" {
  type        = string
  description = "AWS EKS Cluster ID / Name"
}

variable "annotations" {
  type        = map(string)
  default     = {}
  description = "Annotations applied to all Kubernetes resources"
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "Labels applied to all Kubernetes resources"
}

variable "dns_zones" {
  type        = list(string)
  description = "List of hostnames that the ingress gateway will listen to."
}

variable "access_logs_s3_bucket" {
  type        = string
  description = "Loadbalancer Access Logs S3 Bucket name"
}

variable "istio_chart_version" {
  type        = string
  description = "Istio helm chart version"
  default     = "1.13.9"
}
