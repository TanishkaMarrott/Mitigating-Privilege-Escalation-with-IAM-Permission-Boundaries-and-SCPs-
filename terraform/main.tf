provider "aws" {
  region = "us-west-1"
}

resource "aws_iam_role" "devops_role" {
  name               = "DevOpsRole"
  assume_role_policy = data.aws_iam_policy_document.devops_assume_role.json
}

data "aws_iam_policy_document" "devops_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "devops_policy" {
  name   = "DevOpsPolicy"
  policy = file("${path.module}/../policies/devops-policy.json")
}

resource "aws_iam_role_policy_attachment" "devops_policy_attach" {
  role       = aws_iam_role.devops_role.name
  policy_arn = aws_iam_policy.devops_policy.arn
}

resource "aws_iam_policy" "iam_permission_boundary" {
  name   = "IAMPermissionBoundary"
  policy = file("${path.module}/../policies/admin-restricted-boundary.json")
}

resource "aws_iam_role" "project_lead_role" {
  name               = "ProjectLeadRole"
  assume_role_policy = data.aws_iam_policy_document.lead_assume_role.json
  permission_boundary = aws_iam_policy.iam_permission_boundary.arn
}

data "aws_iam_policy_document" "lead_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
