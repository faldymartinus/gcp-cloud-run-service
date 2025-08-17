resource "google_cloud_run_v2_service" "cloudrun_service" {
  name                 = var.service_name
  location             = var.location
  deletion_protection  = false
  ingress              = var.ingress
  invoker_iam_disabled = var.invoker_iam_disabled
  template {
    containers {
      image = var.image
    }
  }
}