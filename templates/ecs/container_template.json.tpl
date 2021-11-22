[
  {
    "name": "${application_name}",
    "image": "${app_image}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "networkMode": "awsvpc",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/${application_key}-${environment}-${application_name}",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": ${port_mappings},
    "environment": ${application_environment},
    "essential": true,
    "mountPoints": [],
    "volumesFrom": []
  }
]
