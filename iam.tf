resource "aws_iam_policy" "CustomECR_DeploymentAccess" {
  name   = "CustomECR_DeploymentAccess"
  policy = file("CustomECR_DeploymentAccess.json")
}

resource "aws_iam_policy" "CustomECS_DeploymentAccess" {
  name   = "CustomECS_DeploymentAccess"
  policy = file("CustomECS_DeploymentAccess.json")
}
