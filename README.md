# Project Overview

This Terraform project is designed to deploy a serverless architecture on Google Cloud Platform (GCP). It utilizes various GCP services, including Google Cloud Run and Google API Gateway, to create a scalable and efficient application. The project is structured into modules for better organization and reusability.

## Project Structure

The project is organized as follows:

```
test
├── main.tf                # Entry point for the Terraform configuration
├── modules                # Contains all the Terraform modules
│   ├── apigateway         # Module for Google API Gateway resources
│   │   ├── apigw.tf       # API Gateway resource definitions
│   │   └── variables.tf    # Input variables for the API Gateway module
│   ├── cloudrun_mobileapi  # Module for the mobile API Cloud Run service
│   │   ├── cloudrunapi.tf  # Cloud Run service definitions for mobile API
│   │   └── variables.tf    # Input variables for the Cloud Run mobile API module
│   ├── cloudrun_webapp     # Module for the web application Cloud Run service
│   │   ├── cloudrunweb.tf   # Cloud Run service definitions for web app
│   │   └── variables.tf     # Input variables for the Cloud Run web app module
│   ├── loadbalancer        # Module for load balancer resources
│   │   ├── lb.tf           # Load balancer resource definitions
│   │   └── variables.tf     # Input variables for the load balancer module
│   └── locals              # Module for local values
│       ├── locals.tf       # Local values used throughout the project
│       └── variables.tf     # Input variables for the locals module
├── apiconfig.yaml.tpl     # OpenAPI specification template for API Gateway
├── outputs.tf             # Outputs for the Terraform configuration
├── providers.tf           # Provider configurations for Google Cloud
├── README.md              # Documentation for the project
└── .terraform.lock.hcl    # Automatically maintained file for provider versions
```

## Modules

### API Gateway Module
- **Purpose**: Defines the Google API Gateway resources.
- **Files**:
  - `apigw.tf`: Contains the resource definitions.
  - `variables.tf`: Defines input variables for the module.

### Cloud Run Mobile API Module
- **Purpose**: Defines the Google Cloud Run service for the mobile API.
- **Files**:
  - `cloudrunapi.tf`: Contains the resource definitions.
  - `variables.tf`: Defines input variables for the module.

### Cloud Run Web App Module
- **Purpose**: Defines the Google Cloud Run service for the web application.
- **Files**:
  - `cloudrunweb.tf`: Contains the resource definitions.
  - `variables.tf`: Defines input variables for the module.

### Load Balancer Module
- **Purpose**: Defines the load balancer resources.
- **Files**:
  - `lb.tf`: Contains the resource definitions.
  - `variables.tf`: Defines input variables for the module.

### Locals Module
- **Purpose**: Defines local values used throughout the project.
- **Files**:
  - `locals.tf`: Contains local values.
  - `variables.tf`: Defines input variables for the module.

## Usage

To deploy the infrastructure defined in this project, follow these steps:

1. Ensure you have Terraform installed on your machine.
2. Navigate to the project directory.
3. Initialize the Terraform configuration:
   ```
   terraform init
   ```
4. Review the planned actions:
   ```
   terraform plan
   ```
5. Apply the configuration to create the resources:
   ```
   terraform apply
   ```

## Outputs

After applying the configuration, you will receive outputs that may include URLs or IDs of the created resources, which can be found in the `outputs.tf` file.

## License

This project is licensed under the MIT License.