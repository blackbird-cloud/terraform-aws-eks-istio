locals {
  ingress_domains = join(",", tolist([for zone in var.dns_zones : "*.${zone}"]))
}

resource "helm_release" "ingress" {
  depends_on = [helm_release.istiod]

  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "gateway"
  version    = var.istio_chart_version

  name      = "istio-ingress"
  namespace = local.istio_ingress_namespace

  values = [
    templatefile("./tmpl/ingress.yaml",
      {
        hostnames             = local.ingress_domains
        access_logs_s3_bucket = var.access_logs_s3_bucket
      }
    )
  ]
}
