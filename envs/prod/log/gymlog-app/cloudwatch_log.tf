resource "aws_cloudwatch_log_group" "frontend" {
  name = "/ecs/${local.name_prefix}-${local.service_name}/frontend"
  retention_in_days = 90
}

resource "aws_cloudwatch_log_group" "backend" {
  name = "/ecs/${local.name_prefix}-${local.service_name}/backend"
  retention_in_days = 90
}