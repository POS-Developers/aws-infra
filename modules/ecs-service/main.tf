resource "aws_ecs_task_definition" "this" {
  family                   = var.service_name
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = "awsvpc"
  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name      = var.service_name
      image     = "docker.io/${var.dockerhub_username}/${var.image_url}"
      cpu       = var.cpu
      memory    = var.memory
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ])
}

# ✅ Add ECS Service to Deploy the Task Definition
resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true
    subnets          = var.subnets
    security_groups  = var.security_groups
  }

  deployment_controller {
    type = "ECS"
  }
}
