output "public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.ec2_instance[*].public_ip
}
