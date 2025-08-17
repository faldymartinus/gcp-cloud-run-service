variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "location" {
  description = "The location where the Cloud Run service will be deployed."
  type        = string
}

variable "image" {
  description = "The container image to be used for the Cloud Run service."
  type        = string
}
variable "ingress" {
  description = "The ingress type for the Cloud Run service."
  type        = string
}
variable "invoker_iam_disabled" {
  description = "The authentication setting for the Cloud Run service invoker."
  type        = string
}