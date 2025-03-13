resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

resource "aws_ecs_capacity_provider" "spot" {
  name = "FARGATE_SPOT"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.ecs_spot.arn
    managed_termination_protection = "ENABLED"

    managed_scaling {
      status          = "ENABLED"
      target_capacity = 100
    }
  }
}
