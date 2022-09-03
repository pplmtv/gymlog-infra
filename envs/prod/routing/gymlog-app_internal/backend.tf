terraform {
  backend "s3" {
    bucket = "pplmtv-tfstate"
    key    = "gymlog-sys/prod/routing/gymlog-app_internal_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}