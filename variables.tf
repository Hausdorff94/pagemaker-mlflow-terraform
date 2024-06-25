variable "vpc" {
  description = "VPC ID"
  type        = string
  default     = "vpc-bd8716c0"

}

variable "subnet" {
  description = "Subnets IDs"
  type        = list(string)
  default     = ["subnet-75bda838"]
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "mlflow_user" {
  description = "MLflow User Profile Name"
  type        = string
  default     = "mlflow-user"
}

variable "app_name" {
  description = "SageMaker App Name"
  type        = string
  default     = "mlflow-app"
}

variable "app_type" {
  description = "SageMaker App Type"
  type        = string
  default     = "JupyterServer"
}