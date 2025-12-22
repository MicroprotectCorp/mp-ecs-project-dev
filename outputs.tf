output "service_name" {
  value = aws_ecs_service.mp_ecs_service.name
}
output "secret_arn" {
  value = aws_secretsmanager_secret.mp_ecs_service_secrets.arn
}

output "ecs_service_sg_id" {
  value = aws_security_group.mp_ecs_service_sg.id
}

output "ecs_target_group_arn" {
  value = (var.need_loadbalancer ? aws_lb_target_group.mp_ecs_service_alb_tg[0].arn : "")
}
