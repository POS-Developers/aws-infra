variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2  # Change as needed
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "ssh_private_key" {
  description = "Private key for SSH access"
  type        = string
  sensitive   = true
}
