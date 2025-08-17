resource "google_compute_region_network_endpoint_group" "clb_cloudrun_webapp_neg" {
  name                  = var.neg_name
  region                = var.region
  network_endpoint_type = var.network_endpoint_type#"SERVERLESS"
  cloud_run {
    service = var.cloud_run_service
  }
}

resource "google_compute_backend_service" "clb_cloudrun_webapp_backend_service" {
  name     = var.backend_service_name
  protocol = "HTTPS"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  enable_cdn            = var.enable_cdn#true

  backend {
    group = google_compute_region_network_endpoint_group.clb_cloudrun_webapp_neg.id
  }
}

resource "google_compute_url_map" "clb_cloudrun_webapp_url_map" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.clb_cloudrun_webapp_backend_service.self_link
}

resource "google_compute_target_http_proxy" "clb_cloudrun_webapp_http_proxy" {
  name    = var.http_proxy_name
  url_map = google_compute_url_map.clb_cloudrun_webapp_url_map.self_link
}

resource "google_compute_global_forwarding_rule" "clb_cloudrun_webapp_http_rule" {
  name                  = var.forwarding_rule_name
  target                = google_compute_target_http_proxy.clb_cloudrun_webapp_http_proxy.self_link
  port_range            = "80"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
}