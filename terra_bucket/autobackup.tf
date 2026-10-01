terraform {
  backend "s3" {
    bucket = "backup.terraform.statefile.bucket"
    key    = "statefiles-folder/terraform.tfstate"
    region = "ap-southeast-2"
  }
}
