data "aws_ecs_task_definition" "test" {
task_definition = "${aws_ecs_task_definition.test.family}"
}

resource "aws_ecs_task_definition" "test" {
family = "test-family"

container_definitions = <<DEFINITION
 [
    {
       "name": "tricon",
       "image": "santhosh1994m/sanrepo",
       "memory": 500 ,
       "cpu": 500,
       "essential": true,
       "memoryReservation": 500,
       "portMappings":[
       {
       "hostPort": 8080,
       "containerPort": 8080,
       "protocol": "tcp"
        }
    ]
  }
]
DEFINITION
}
