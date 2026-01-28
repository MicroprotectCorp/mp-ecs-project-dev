variable "application_name" {}
variable "mp_project" {
  default = "zzl"
}
variable "mp_region" {
  default = "apne2"
}
variable "mp_environment" {
  default = "dev"
}
variable "vpc_id" {
  default = "vpc-0b359cce648812a01"
}
variable "subnet_ids" {
  default = ["subnet-05060cddc1856fd3e", "subnet-0fefc834c9152eab3"]
}
variable "cluster_arn" {
  default = "arn:aws:ecs:ap-northeast-2:480758641270:cluster/zzl-apne2-ecs-cluster-dev"
}
variable "need_loadbalancer" {
  type    = bool
  default = false
}
variable "loadbalancer_arn" {
  default = "arn:aws:elasticloadbalancing:ap-northeast-2:480758641270:loadbalancer/app/zzl-apne2-pub-alb-dev/a2be47b57b2b8e95"
}
variable "container_port" {
  default = 23215
}
variable "listener_port" {
  default = 23215
}
variable "listener_protocol" {
  default = "HTTP"
}
variable "listener_ssl_policy" {
  default = null
}
variable "alb_certificate_arn" {
  default = null
}
variable "loadbalancer_sg" {
  default = "sg-06c7b94d84668555b"
}
variable "tg_health_check" {
  type = object({
    enabled             = bool
    healthy_threshold   = number
    interval            = number
    matcher             = string
    path                = string
    port                = string
    protocol            = string
    timeout             = number
    unhealthy_threshold = number
  })

  default = {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/actuator/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}
variable "listener_rule_priority" {
  default = 99999
}
variable "management_sg" {
  type    = string
  default = "sg-04edef1bedb171c8a"
}
variable "ecs_sg_ingress_rules" {
  description = "List of ingress rules for the ECS security group"
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    security_groups  = list(string)
    prefix_list_ids  = list(string)
  }))
  default = []
}

variable "circuit_breaker" {
  type    = bool
  default = false
}
variable "circuit_breaker_rollback" {
  type    = bool
  default = false
}

variable "enable_execute_command" {
  default = false
  type    = bool
}

variable "tg_stickiness" {
  type = object({
    enabled         = bool
    type            = string
    cookie_duration = number
  })
  default = {
    enabled         = false
    type            = "lb_cookie"
    cookie_duration = 86400
  }
}
