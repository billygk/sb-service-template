terraform {
  backend "s3" {
    encrypt = false
    bucket = "dev-terraform-state"
    region = "us-east-1"
    key = "terraform.tfstate"
  }
}
