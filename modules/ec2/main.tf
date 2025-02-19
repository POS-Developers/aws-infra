resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  count         = var.instance_count
  instance_type = var.instance_type
  key_name      = var.key_name

  
  tags = {
    Name = var.instance_name
  }

  
}
