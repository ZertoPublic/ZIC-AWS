resource "aws_iam_role_policy_attachment" "zic_attach" {
    role       = "${aws_iam_role.zic_role.name}"
    policy_arn = "${aws_iam_policy.zic_policy.arn}"
}

resource "aws_iam_instance_profile" "zic_profile" {
  name = "${var.user-identifier}-iam_role_zic"
  role = "${aws_iam_role.zic_role.name}"
}

resource "aws_iam_role" "zic_role" {
  name        = "${var.user-identifier}-iam_role_zic"
  description = "${var.user-identifier} - ZIC IAM Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "zic_policy" {
  name        = "${var.user-identifier}-iam_policy_zic"
  path        = "/"
  description = "${var.user-identifier} - ZIC IAM Policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:CopySnapshot",
                "ec2:DeleteSnapshot",
                "ec2:CreateSnapshots",
                "ec2:ModifySnapshotAttribute",
                "ec2:DescribeInstanceTypeOfferings",
                "ec2:CreateVolume",
                "ec2:AttachVolume",
                "ec2:DetachVolume",
                "ec2:ModifyVolume",
                "ec2:DeleteVolume",
                "ec2:CreateTags",
                "ec2:RunInstances",
                "ec2:DescribeImages",
                "ec2:DescribeSnapshots",
                "ec2:DescribeRegions",
                "ec2:DescribeInstances",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeVpcs",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeSubnets",
                "ec2:DescribeVolumes",
                "ec2:DescribeVolumeStatus",
                "ec2:DescribeInstanceAttribute",
                "ec2:DescribeInstances",
                "ec2:DescribeTags",
                "ec2:ModifyInstanceAttribute",
                "ec2:RunInstances",
                "ec2:ModifyInstanceAttribute",
                "ec2:ModifyNetworkInterfaceAttribute",
                "ec2:StartInstances",
                "ec2:TerminateInstances",
                "ec2:CreateTags",
                "ec2:DeleteTags",
                "ec2:StopInstances",
                "dynamodb:DescribeTable",
                "dynamodb:CreateTable",
                "dynamodb:PutItem",
                "dynamodb:Scan",
                "dynamodb:GetItem",
                "dynamodb:DeleteItem",
                "dynamodb:Query",
                "dynamodb:BatchGetItem",
                "dynamodb:DeleteTable",
                "dynamodb:ListTables",
                "sts:AssumeRole",
                "iam:passRole",
                "kms:CreateGrant",
                "kms:Decrypt",
                "kms:DescribeKey",
                "kms:GenerateDataKeyWithoutPlainText"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
