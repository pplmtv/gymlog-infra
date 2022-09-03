terraform {
  backend "s3" {
    bucket = "pplmtv-tfstate"
    key    = "gymlog-sys/prod/db/gymlog-app_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}