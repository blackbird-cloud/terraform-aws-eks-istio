resource "kubernetes_namespace" "istio_system" {
  metadata {
    name        = "istio-system"
    annotations = var.annotations
    labels      = var.labels
  }
}

resource "kubernetes_namespace" "istio_ingress" {
  metadata {
    name        = "istio-ingress"
    annotations = var.annotations
    labels = merge(var.labels, {
      "istio-injection" : "enabled",
      #  "istio.io/rev": "default"
    })
  }
}

locals {
  istio_system_namespace  = kubernetes_namespace.istio_system.metadata[0].name
  istio_ingress_namespace = kubernetes_namespace.istio_ingress.metadata[0].name
}
