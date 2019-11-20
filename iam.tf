# ----------------------------
# Bastion EC2 Instance Profile
# ----------------------------
resource "aws_iam_instance_profile" "bastion_instance_profile" {
  name = "${var.environment}_bastion_instance_profile"
  role = aws_iam_role.bastion_role.name
}

# ----------------
# Bastion EC2 Role
# ----------------
resource "aws_iam_role" "bastion_role" {
  name = "${var.environment}_bastion_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

# ---------------------------------
# Attach Bastion Policy to Role
# ---------------------------------
resource "aws_iam_role_policy_attachment" "bastion_attach_ec2_policy" {
  role       = aws_iam_role.bastion_role.name
  policy_arn = aws_iam_policy.bastion_policy.arn
}

# ---------------------------------
# Attach default s3 RO Policy to Role
# ---------------------------------
resource "aws_iam_role_policy_attachment" "bastion_attach_s3_ro__policy" {
  role       = aws_iam_role.bastion_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
# ---------------------------------
# Attach default CodeDeploy Policy to Role
# ---------------------------------
resource "aws_iam_role_policy_attachment" "bastion_attach_CodeDeploy_policy" {
  role       = aws_iam_role.bastion_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeDeployFullAccess"
}

# ------------------
# Bastion IAM Policy
# ------------------
resource "aws_iam_policy" "bastion_policy" {
  name        = "${var.environment}_bastion_policy"
  path        = "/"
  description = "${var.environment} Bastion IAM Policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1477071439000",
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets"
      ],
      "Resource": [
        "arn:aws:route53:::hostedzone/${var.hosted_zone_id}"
      ]
    },
        {
            "Sid": "SSMReadAndStartSession",
            "Effect": "Allow",
            "Action": [
                "ssm:SendCommand",
                "ssm:ListCommands",
                "ssm:ResumeSession",
                "ssm:ListDocumentVersions",
                "ssm:DescribeMaintenanceWindowSchedule",
                "ssm:DescribeInstancePatches",
                "ssm:ListInstanceAssociations",
                "ssm:GetParameter",
                "ssm:GetMaintenanceWindowExecutionTaskInvocation",
                "ssm:StartSession",
                "ssm:DescribeAutomationExecutions",
                "ssm:GetMaintenanceWindowTask",
                "ssm:DescribeMaintenanceWindowExecutionTaskInvocations",
                "ssm:DescribeAutomationStepExecutions",
                "ssm:UpdateInstanceInformation",
                "ssm:DescribeParameters",
                "ssm:ListResourceDataSync",
                "ssm:ListDocuments",
                "ssm:DescribeMaintenanceWindowsForTarget",
                "ssm:ListComplianceItems",
                "ssm:GetConnectionStatus",
                "ssm:GetMaintenanceWindowExecutionTask",
                "ssm:GetOpsItem",
                "ssm:GetMaintenanceWindowExecution",
                "ssm:ListResourceComplianceSummaries",
                "ssm:GetParameters",
                "ssm:DescribeOpsItems",
                "ssm:DescribeMaintenanceWindows",
                "ssm:DescribeEffectivePatchesForPatchBaseline",
                "ssm:GetServiceSetting",
                "ssm:DescribeAssociationExecutions",
                "ssm:DescribeDocumentPermission",
                "ssm:ListCommandInvocations",
                "ssm:GetAutomationExecution",
                "ssm:DescribePatchGroups",
                "ssm:GetDefaultPatchBaseline",
                "ssm:DescribeDocument",
                "ssm:DescribeMaintenanceWindowTasks",
                "ssm:ListAssociationVersions",
                "ssm:GetPatchBaselineForPatchGroup",
                "ssm:PutConfigurePackageResult",
                "ssm:DescribePatchGroupState",
                "ssm:DescribeMaintenanceWindowExecutions",
                "ssm:GetManifest",
                "ssm:DescribeMaintenanceWindowExecutionTasks",
                "ssm:DescribeInstancePatchStates",
                "ssm:DescribeInstancePatchStatesForPatchGroup",
                "ssm:GetDocument",
                "ssm:GetInventorySchema",
                "ssm:GetParametersByPath",
                "ssm:GetMaintenanceWindow",
                "ssm:DescribeInstanceAssociationsStatus",
                "ssm:DescribeAssociationExecutionTargets",
                "ssm:GetPatchBaseline",
                "ssm:DescribeInstanceProperties",
                "ssm:ListInventoryEntries",
                "ssm:DescribeAssociation",
                "ssm:GetDeployablePatchSnapshotForInstance",
                "ssm:DescribeSessions",
                "ssm:GetParameterHistory",
                "ssm:DescribeMaintenanceWindowTargets",
                "ssm:DescribePatchBaselines",
                "ssm:DescribeEffectiveInstanceAssociations",
                "ssm:DescribeInventoryDeletions",
                "ssm:DescribePatchProperties",
                "ssm:GetInventory",
                "ssm:GetOpsSummary",
                "ssm:DescribeActivations",
                "ssm:GetCommandInvocation",
                "ssm:ListComplianceSummaries",
                "ssm:DescribeInstanceInformation",
                "ssm:ListTagsForResource",
                "ssm:DescribeDocumentParameters",
                "ssm:ListAssociations",
                "ssm:DescribeAvailablePatches",
                "ssmmessages:OpenControlChannel",
                "ssmmessages:OpenDataChannel",
                "ssmmessages:CreateControlChannel",
                "ssmmessages:CreateDataChannel"
            ],
            "Resource": "*"
        }
  ]
}
EOF
}












