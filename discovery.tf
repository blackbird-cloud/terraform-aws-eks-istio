resource "helm_release" "istiod" {
  depends_on = [helm_release.istio_base]

  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istiod"
  version    = var.istio_chart_version

  name      = "istiod"
  namespace = local.istio_system_namespace

  values = [
    file("./tmpl/istiod.yaml")
  ]
}
