// referenced by ecspresso

data "aws_cloudwatch_log_group" "frontend" {
  name = "/ecs/${local.name_prefix}-${local.service_name}/frontend"
}

data "aws_cloudwatch_log_group" "backend" {
  name = "/ecs/${local.name_prefix}-${local.service_name}/backend"
}

data "aws_ecr_repository" "frontend" {
  name = "${local.name_prefix}-${local.service_name}-frontend"
}

data "aws_ecr_repository" "backend" {
  name = "${local.name_prefix}-${local.service_name}-backend"
}

data "aws_iam_role" "ecs_task_execution" {
  name = "${local.name_prefix}-${local.service_name}-ecs-task-execution"
}

data "aws_iam_role" "ecs_task" {
  name = "${local.name_prefix}-${local.service_name}-ecs-task"
}

data "aws_lb_target_group" "this" {
  name = "${local.name_prefix}-${local.service_name}"
}

data "aws_security_group" "cache" {
  name = "${local.name_prefix}-main-cache"
}

data "aws_security_group" "db" {
  name = "${local.name_prefix}-main-db"
}

data "aws_security_group" "vpc" {
  name = "${local.name_prefix}-main-vpc"
}

data "aws_subnet" "private" {
  for_each = var.azs

  tags = {
    Name = "${local.name_prefix}-main-private-${each.key}"
  }
}

variable "azs" {
  type = map(object({
    public_cidr  = string
    private_cidr = string
  }))
  default = {
    a = {
      public_cidr  = "172.41.0.0/20"
      private_cidr = "172.41.48.0/20"
    },
    c = {
      public_cidr  = "172.41.16.0/20"
      private_cidr = "172.41.64.0/20"
    }
  }
}