resource "google_api_gateway_api" "apigw_mobileapi" {
  provider = "google-beta"
  api_id   = var.api_id
  project  = var.project_id
}

resource "google_api_gateway_api_config" "apigw_mobileapi_config" {
  provider      = "google-beta"
  api           = google_api_gateway_api.apigw_mobileapi.api_id
  api_config_id = var.api_config_id
  project       = var.project_id
  display_name  = var.display_name#"apigw-mobileapi-config"

  openapi_documents {
    document {
      path     = "apiconfig.yaml"
      contents = base64encode(var.openapi_spec)
    }
  }
  depends_on = [google_api_gateway_api.apigw_mobileapi]
}

resource "google_api_gateway_gateway" "apigw_mobileapi_gateway" {
  provider   = "google-beta"
  gateway_id = var.gateway_id#"apigw-mobileapi-gateway"
  api_config = google_api_gateway_api_config.apigw_mobileapi_config.id
  region     = var.region
  project    = var.project_id
}