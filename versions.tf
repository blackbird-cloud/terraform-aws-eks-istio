terraform {
  required_providers {
    aws = {
      version = "4.15.1"
      source  = "hashicorp/aws"
    }
    helm = {
      version = "2.4.1"
      source  = "hashicorp/helm"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }
  required_version = ">= 1"
}
