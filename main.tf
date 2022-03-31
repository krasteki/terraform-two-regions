terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.1.0"
      #configuration_aliases = [ aws.alternate ]
    }
  }
  required_version = "~>1.1.0"
}

provider "aws" {
  region = "eu-west-1"
  alias = "Ireland"
}

provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}

provider "aws" {
  region = "eu-west-3"
  alias = "Paris"
}
