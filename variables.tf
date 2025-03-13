variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "staging-server"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
  default = "django-ssh-key"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-00bb6a80f01f03502"  # Replace with your region’s AMI
}

variable "ssh_private_key" {
  description = "Private key for SSH access"
  type        = string
  sensitive   = true
  
}

variable "backend_image_url" {
  description = "Docker Hub Image for Backend"
  type        = string
}

variable "frontend_image_url" {
  description = "Docker Hub Image for Frontend"
  type        = string
}
