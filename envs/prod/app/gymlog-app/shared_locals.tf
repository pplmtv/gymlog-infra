locals {
  name_prefix = "${local.system_name}-${local.env_name}"
  system_name = "gymlog-sys"
  env_name    = "prod"
}