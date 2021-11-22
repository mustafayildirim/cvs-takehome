# variables.tf

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "eu-west-1"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "myEcsTaskExecutionRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "application_key" {
  description = "Application Key"
  default     = "cvs"
}

variable "ecs_fargate_apps_test" {
  type = set(object({
    app_image               = string
    app_port                = number
    app_count               = number
    health_check_path       = string
    fargate_cpu             = string
    fargate_memory          = string
    application_name        = string
    host_header             = string
    priority                = number
    slow_start              = number
    matcher                 = string
    application_environment = list(map(string))
    port_mappings = list(object({
      containerPort = number
      hostPort      = number
      protocol      = string
    }))
  }))
  description = "Data object representing fields for ECS Services to create"
}