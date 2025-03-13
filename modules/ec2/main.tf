resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  count         = var.instance_count
  instance_type = var.instance_type
  key_name      = var.key_name

 lifecycle {
    ignore_changes = [ami, instance_type, tags]   #ignore ec2 while applying terraform apply
  }

  
  tags = {
    Name = var.instance_name
  }

  
}
