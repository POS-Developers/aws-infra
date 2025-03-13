
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


module "backend_service" {
  source             = "./modules/ecs-service"
  service_name       = "pos-backend"
  cluster_id         = module.ecs_cluster.ecs_cluster_id
  dockerhub_username = var.dockerhub_username
  image_url          = "pos-backend:latest"
  cpu               = 512
  memory            = 1024
  container_port     = 8000
  subnets           = data.aws_subnets.default.ids
  security_groups   = [module.security_group.security_group_id]
  execution_role_arn = module.ecs_execution_role.arn
}

module "frontend_service" {
  source             = "./modules/ecs-service"
  service_name       = "pos-frontend"
  cluster_id         = module.ecs_cluster.ecs_cluster_id
  dockerhub_username = var.dockerhub_username
  image_url          = "pos-frontend:latest"
  cpu               = 256
  memory            = 512
  container_port     = 5173
  subnets           = data.aws_subnets.default.ids
  security_groups   = [module.security_group.security_group_id]
  execution_role_arn = module.ecs_execution_role.arn
}
