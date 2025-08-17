variable "neg_name" {
  description = "Name for the Serverless Network Endpoint Group"
  type        = string
}

variable "region" {
  description = "Region for the resources"
  type        = string
}

variable "network_endpoint_type" {
  description = "Type of network endpoint group"
  type        = string
}

variable "cloud_run_service" {
  description = "Name of the Cloud Run service to attach to the NEG"
  type        = string
}

variable "backend_service_name" {
  description = "Name for the backend service"
  type        = string
}

variable "enable_cdn" {
  description = "Enable CDN for backend service"
  type        = bool
}

variable "url_map_name" {
  description = "Name for the URL map"
  type        = string
}

variable "http_proxy_name" {
  description = "Name for the HTTP proxy"
  type        = string
}

variable "forwarding_rule_name" {
  description = "Name for the global forwarding rule"
  type        = string
}