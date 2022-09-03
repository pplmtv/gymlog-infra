resource "aws_iam_role" "rds_monitoring_role" {
  name = "${local.system_name}-${local.env_name}-${local.service_name}-rds-monitoring-role"


  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "monitoring.rds.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )
}