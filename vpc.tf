resource "aws_vpc" "mlflow_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "mlflow-vpc"
  }
}

resource "aws_subnet" "mlflow_subnet" {
  vpc_id     = aws_vpc.mlflow_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "mlflow-subnet"
  }
}