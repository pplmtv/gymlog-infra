terraform {
  backend "s3" {
    bucket = "pplmtv-tfstate"
    key    = "gymlog-sys/prod/routing/gymlog-app_link_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}