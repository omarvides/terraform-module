# Terraform module example
## Getting started

To get started with this repository
1. first configure your aws crendentials with [aws cli](https://aws.amazon.com/cli)
2. Then create a file named ```configuration.conf``` at the root of this project containing ```bucket``` and ```key``` values like
```
bucket = "your-bucket-name-xxxx"
key = "my-subfolder/terraform.tfstate"
```
3. Initialize the repository at the root of this project by running
```
terraform init -backend-config=configuration.conf
```
This module will create the bucket and key for you if it doesn't yet exists at AWS S3


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| my_blog_count |  | string | `2` | no |
| my_site_count |  | string | `2` | no |

