data "aws_caller_identity" "self" {}

data "aws_region" "current" {}

data "terraform_remote_state" "network_main" {
  backend = "s3"
  config = {
    bucket = "pplmtv-tfstate"
    key    = "${local.system_name}/${local.env_name}/network/main_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "routing_gymlog-app_link" {
  backend = "s3"


  config = {
    bucket = "pplmtv-tfstate"
    key    = "${local.system_name}/${local.env_name}/routing/gymlog-app_link_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}