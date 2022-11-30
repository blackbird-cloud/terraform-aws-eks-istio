resource "helm_release" "istio_base" {
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
  version    = var.istio_chart_version

  name      = "istio-base"
  namespace = local.istio_system_namespace
}
