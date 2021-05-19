terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = var.config_path
}

resource "kubernetes_deployment" "webapp" {
  metadata {
    name = "webapp"
  }
  spec {
    min_ready_seconds = 30
    selector {
      match_labels = {
        app = "webapp"
      }
    }
    replicas = 2
    template {
      metadata {
        labels = {
          app = "webapp"
        }
      }
      spec {
        container {
          name  = "webapp"
          image = "richardchesterwood/k8s-fleetman-webapp-angular:release0-5"
        }
      }
    }
  }
}

resource "kubernetes_service" "fleetman-webapp" {
  metadata {
    name = "fleetman-webapp"
  }
  spec {
    selector = {
      app = kubernetes_deployment.webapp.spec.0.template.0.metadata.0.labels.app
    }
    port {
      name      = "http"
      port      = 80
      node_port = 30080
    }
    type = "NodePort"
  }
}
