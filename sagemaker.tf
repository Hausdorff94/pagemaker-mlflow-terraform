resource "aws_sagemaker_domain" "mlflow_domain" {
  domain_name = "mlflow_domain"
  auth_mode   = "IAM"
  vpc_id      = var.vpc
  subnet_ids  = var.subnet

  default_user_settings {
    execution_role = aws_iam_role.mlflow_role.arn
  }
}

resource "aws_sagemaker_app" "mlflow_app" {
  domain_id         = aws_sagemaker_domain.mlflow_domain.id
  user_profile_name = aws_sagemaker_user_profile.mlflow_user.user_profile_name
  app_name          = "mlflow_app"
  app_type          = "JupyterServer"
  depends_on        = [aws_sagemaker_domain.mlflow_domain]
}

resource "aws_sagemaker_user_profile" "mlflow_user" {
  domain_id         = aws_sagemaker_domain.mlflow_domain.id
  user_profile_name = "mlflow_user"
  depends_on        = [aws_sagemaker_app.mlflow_app]
}