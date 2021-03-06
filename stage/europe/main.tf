/**
* # Terraform module example
* ## Getting started
* 
* To get started with this repository 
* 1. first configure your aws crendentials with [aws cli](https://aws.amazon.com/cli) 
* 2. Then create a file named ```configuration.conf``` at the root of this project containing ```bucket``` and ```key``` values like 
* ```
* bucket = "your-bucket-name-xxxx"
* key = "my-subfolder/terraform.tfstate"
* ```
* 3. Initialize the repository at the root of this project by running
* ```
* terraform init -backend-config=configuration.conf
* ```
* This module will create the bucket and key for you if it doesn't yet exists at AWS S3
*/

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }
}

terraform {
  backend "s3" {
    region = "us-east-1"
    encrypt = true
  }
}

module "mysite" {
  source = "git@github.com:omarvides/terraform-resource.git//aws"
  instance_type = "t2.micro"
  count = "${var.my_site_count}"
  tag_name = "site-stage"
  region = "eu-central-1"
}

module "myblog" {
  source = "git@github.com:omarvides/terraform-resource.git//aws"
  instance_type = "t2.micro"
  count = "${var.my_blog_count}"
  tag_name = "blog-stage"
  region = "eu-central-1"
}

