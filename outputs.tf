output "namespace" {
  value       = local.istio_ingress_namespace
  description = "Kubernetes namespace that holds the Istio ingress gateway"
}
