terraform {
  backend "s3" {
    bucket = "pplmtv-tfstate"
    key    = "gymlog-sys/prod/cache/gymlog-app_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}