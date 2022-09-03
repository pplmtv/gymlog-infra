data "terraform_remote_state" "network_main" {
  backend = "s3"

  config = {
    bucket = "pplmtv-tfstate"
    key    = "${local.system_name}/${local.env_name}/network/main_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}

/*
data "terraform_remote_state" "db_gymlog-app" {
  backend = "s3"

  config = {
    bucket = "pplmtv-tfstate"
    key    = "${local.system_name}/${local.env_name}/db/gymlog-app_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "cache_gymlog-app" {
  backend = "s3"

  config = {
    bucket = "pplmtv-tfstate"
    key    = "${local.system_name}/${local.env_name}/cache/gymlog-app_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}
*/