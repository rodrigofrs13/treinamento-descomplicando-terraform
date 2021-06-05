provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:/Users/roee/.aws/credentials"
  profile                 = "default"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "terrafor-tfstate-sg"
    key    = "descomplicandoterraform/terraform.state"
    region = "us-east-1"
    profile = "default"
  }
}