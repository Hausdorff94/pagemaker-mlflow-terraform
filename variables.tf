variable "vpc" {
  description = "VPC ID"
  type        = string
  default     = "vpc-bd8716c0"

}

variable "subnet" {
    description = "Subnets IDs"
    type = list(string)
    default = ["subnet-75bda838"]
}

variable "region" {
    description = "AWS Region"
    type = string
    default = "us-east-1"
}