data "aws_region" "current" {}
provider "aws" {
  region  = data.aws_region.current.name
  profile = "default"
}