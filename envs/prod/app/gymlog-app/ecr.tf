module "backend" {
  source = "../../../../modules/ecr"

  name = "${local.name_prefix}-${local.service_name}-backend"
}

module "frontend" {
  source = "../../../../modules/ecr"

  name = "${local.name_prefix}-${local.service_name}-frontend"
}
