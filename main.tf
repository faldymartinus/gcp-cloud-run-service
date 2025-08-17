
module "cloudrun_mobileapi" {
  source               = "./modules/cloudrun"
  service_name         = "cloudrun-mobileapi-service"
  location             = local.region
  image                = "us-docker.pkg.dev/cloudrun/container/hello"
  ingress              = "INGRESS_TRAFFIC_ALL"
  invoker_iam_disabled = false
}

module "cloudrun_webapp" {
  source               = "./modules/cloudrun"
  service_name         = "cloudrun-webapp-service"
  location             = local.region
  image                = "us-docker.pkg.dev/cloudrun/container/hello"
  ingress              = "INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"
  invoker_iam_disabled = true
}

module "loadbalancer" {
  source                = "./modules/loadbalancer"
  backend_service_name  = "clb-cloudrun-webapp-backend-service"
  region                = local.region
  cloud_run_service     = module.cloudrun_webapp.service_name
  enable_cdn            = true
  neg_name              = "clb-cloudrun-webapp-neg"
  url_map_name          = "clb-cloudrun-webapp-url-map"
  forwarding_rule_name  = "clb-cloudrun-webapp-forwarding-rule"
  http_proxy_name       = "clb-cloudrun-webapp-http-proxy"
  network_endpoint_type = "SERVERLESS"
}

module "apigateway" {
  source        = "./modules/apigateway"
  project_id    = local.project_id
  api_id        = "apigw-mobileapi"
  api_config_id = "v1"
  region        = "asia-northeast1" #apigateway currently not available in asia-southeast2
  gateway_id    = "apigw-mobileapi-gateway"
  display_name  = "API Gateway for Mobile API"
  openapi_spec = templatefile("${path.module}/apiconfig.yaml.tpl", {
    cloud_run_url = module.cloudrun_mobileapi.cloud_run_mobileapi_url
  })
}