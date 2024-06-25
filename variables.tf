variable "vpc" {
  description = "The VPC ID"
  type        = string
  default     = "value"

}

variable "subnet" {
  description = "The subnet ID"
  type        = list(string)
  default     = ["value"]
}