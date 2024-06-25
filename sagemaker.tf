resource "aws_sagemaker_domain" "mlflow_domain" {
  domain_name = "mlflow_domain"
  auth_mode   = "IAM"
  vpc_id      = var.vpc
  subnet_ids  = var.subnet

  default_user_settings {
    execution_role = aws_iam_role.mlflow_example.arn
  }
}

resource "aws_iam_role" "mlflow_role" {
  name               = "mlflow_role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.mlflow_trust_policy.json
}

data "aws_iam_policy_document" "mlflow_trust_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

resource "aws_sagemaker_app" "example" {
  domain_id         = aws_sagemaker_domain.mlflow_domain.id
  user_profile_name = aws_sagemaker_user_profile.mlflow_user.user_profile_name
  app_name          = "mlflow_app"
  app_type          = "JupyterServer"
}

resource "aws_sagemaker_user_profile" "mlflow_user" {
  domain_id         = aws_sagemaker_domain.mlflow_domain.id
  user_profile_name = "mlflow_user"
}