resource "kubernetes_manifest" "allow_chunked_length" {
  depends_on = [helm_release.ingress]

  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind"       = "EnvoyFilter"
    "metadata" = {
      "name"      = "envoy-filter-developer-ui"
      "namespace" = local.istio_system_namespace
    }
    "spec" = {
      "configPatches" = [
        {
          "applyTo" = "CLUSTER"
          "match" = {
            "context" = "ANY"
          }
          "patch" = {
            "operation" = "MERGE"
            "value" = {
              "http_protocol_options" = {
                "allow_chunked_length" = true
              }
            }
          }
        }
      ]
    }
  }
}
