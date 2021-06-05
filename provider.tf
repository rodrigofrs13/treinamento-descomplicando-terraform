provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:/Users/roee/.aws/credentials"
  profile                 = "default"
}

terraform {
  backend "s3" {
    bucket = "terrafor-tfstate-sg"
    key    = "descomplicandoterraform/terraform.state"
    region = "us-east-1"
    profile = "default"
  }
}