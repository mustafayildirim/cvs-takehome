ecs_fargate_apps_test = [
  {
    app_image         = "123456789012.dkr.ecr.eu-west-1.amazonaws.com/test_app:latest",
    app_port          = 8080,
    app_count         = 1,
    health_check_path = "/healthcheck",
    fargate_cpu       = "256",
    fargate_memory    = "512",
    application_name  = "test-app",
    host_header       = "test-app.domain.net",
    matcher           = "200",
    priority          = 10,
    slow_start        = 30,
    port_mappings = [
      {
        containerPort = 8080,
        hostPort      = 8080,
        protocol      = "tcp"
      }
    ],
    application_environment = [
      {
        name  = "APP_NAME",
        value = "Test"
      }
    ]
  },
  {
    app_image         = "123456789012.dkr.ecr.eu-west-1.amazonaws.com/test_app2:latest",
    app_port          = 8080,
    app_count         = 1,
    health_check_path = "/healthcheck",
    fargate_cpu       = "256",
    fargate_memory    = "512",
    application_name  = "test-app2",
    host_header       = "test-app2.domain.net",
    matcher           = "200",
    priority          = 10,
    slow_start        = 30,
    port_mappings = [
      {
        containerPort = 8080,
        hostPort      = 8080,
        protocol      = "tcp"
      }
    ],
    application_environment = [
      {
        name  = "APP_NAME",
        value = "Test2"
      }
    ]
  }
]