provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "gomawsbuckt"
    key            = "prod/terraform/state"
    region         = "us-east-1"
    
    
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0" 
    }
  }
}
