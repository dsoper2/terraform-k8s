terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  # config_path = var.config_path
  host                   = var.host
  client_certificate     = base64decode(var.client_cert)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_cert)
}

resource "kubernetes_deployment" "fleetman_webapp_deploy" {
  metadata {
    name = "fleetman-webapp-d"
  }
  spec {
    min_ready_seconds = 30
    selector {
      match_labels = {
        app = "fleetman-webapp-d"
      }
    }
    replicas = 2
    template {
      metadata {
        labels = {
          app = "fleetman-webapp-d"
        }
      }
      spec {
        container {
          name  = "fleetman-webapp-d"
          image = "richardchesterwood/k8s-fleetman-webapp-angular:release0-5"
          #  image = "richardchesterwood/k8s-fleetman-webapp-angular"
        }
      }
    }
  }
}

resource "kubernetes_service" "fleetman_webapp_service" {
  metadata {
    name = "fleetman-webapp-s"
  }
  spec {
    selector = {
      app = kubernetes_deployment.fleetman_webapp_deploy.spec.0.template.0.metadata.0.labels.app
    }
    port {
      name = "http"
      port = 80
    }
    type = "NodePort"
  }
}
