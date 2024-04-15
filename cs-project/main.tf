# AWS provider configuration
provider "aws" {
  region = "us-east-1"
}

# Vault provider configuration
provider "vault" {
  address = "http://3.82.196.118:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"
    method = "approle"

    parameters = {
      role_id = "00191e3b-2765-739b-bdd8-cd0bdda350a5"
      secret_id = "8afc8993-9929-d91c-2088-8f0cf2354197"
    }
  }
}

# Vault KV secret data source
data "vault_kv_secret_v2" "example" {
  mount = "secret"
  name  = "test-secret"
}

# AWS instance resource
resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name   = "test-instance"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
