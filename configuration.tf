provider "aws" {
  region = "eu-west-3"
  shared_credentials_file = "../.aws/credentials"
  profile="terraform"

}

terraform {
  backend "s3" {
    bucket = "tf-remote-state-04938473"
    key = "terraform-wordpress/jenkins-terraform.tfstate"
    region ="eu-west-3"
  }
}
