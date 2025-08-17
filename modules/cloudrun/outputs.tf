output "cloud_run_mobileapi_url" {
  value = google_cloud_run_v2_service.cloudrun_service.uri
}

output "service_name" {
  value = google_cloud_run_v2_service.cloudrun_service.name
}