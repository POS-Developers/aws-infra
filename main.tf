
provider "aws" {
  region = "ap-south-1"
}

module "staging_ec2" {
  source        = "./modules/ec2"
  instance_name = var.instance_name
  instance_count = var.instance_count
  instance_type = var.instance_type
  key_name      = var.key_name
  ami_id        = var.ami_id
  ssh_private_key = var.ssh_private_key
}
