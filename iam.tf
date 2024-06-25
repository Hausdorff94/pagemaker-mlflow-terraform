resource "aws_iam_role" "mlflow_role" {
  name = "mlflow_role_name"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "mlflow_policy" {
  name = "mlflow_policy"
  role = aws_iam_role.mlflow_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "GeneralAWSActions",
        Action = [
          "s3:Get*",
          "s3:Put*",
          "s3:List*",
          "sagemaker:AddTags",
          "sagemaker:CreateModelPackageGroup",
          "sagemaker:CreateModelPackage",
          "sagemaker:UpdateModelPackage",
          "sagemaker:DescribeModelPackageGroup"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Sid" : "MlflowTrackingServerActions",
        "Action" : [
          "sagemaker:CreateMlflowTrackingServer",
          "sagemaker:UpdateMlflowTrackingServer",
          "sagemaker:DeleteMlflowTrackingServer",
          "sagemaker:StartMlflowTrackingServer",
          "sagemaker:StopMlflowTrackingServer",
          "sagemaker:CreatePresignedMlflowTrackingServerUrl"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Sid" : "MlflowActions",
        "Action" : [
          "sagemaker-mlflow:*"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}