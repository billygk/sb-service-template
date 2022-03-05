terraform {
  backend "s3" {
    encrypt = false
    bucket = "tehub-dev-terraform-state"
    region = "us-east-1"
    key = "terraform.tfstate"
  }
}
