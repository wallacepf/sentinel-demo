variable "vcs_oauth_key" {}
variable "aws_access_key" { sensitive = true }
variable "aws_secret_id" { sensitive = true }
variable "token" { sensitive = true }
variable "branch" {}
variable "vault_token" { 
    sensitive = true 
    default = "mytoken"
    }
variable "vault_addr" {
    sensitive = true
    default = "http://127.0.0.1:8200"
    }