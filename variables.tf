variable "vpc" {
    description = "The VPC ID"
    type = string
    default = "value"
  
}

variable "subnet" {
    description = "The subnet ID"
    type = list(string)
    default = ["value"]
}

variable "region" {
    description = "AWS Region"
    type = string
    default = "us-east-1"
}