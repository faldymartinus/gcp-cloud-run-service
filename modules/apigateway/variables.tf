variable "api_id" {
  description = "The API ID for the API Gateway"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "api_config_id" {
  description = "The API config ID"
  type        = string
}

variable "display_name" {
  description = "Display name for the API config"
  type        = string
}

variable "openapi_spec" {
  description = "OpenAPI specification in YAML format"
  type        = string
}

variable "gateway_id" {
  description = "Gateway ID for the API Gateway"
  type        = string
}

variable "region" {
  description = "Region for the API Gateway"
}