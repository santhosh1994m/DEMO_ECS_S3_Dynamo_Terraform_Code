data "aws_ecs_task_definition" "test" {
task_definition = "${aws_ecs_task_definition.test.family}"
}

resource "aws_ecs_task_definition" "test" {
family = "test-family"

container_definitions = <<DEFINITION
 [
    {
       "name": "tricon",
       "image": "santhosh1994m/sanrepo:tricon",
       "memory": 500 ,
       "cpu": 500,
       "essential": true,
       "memoryReservation": 500,
       "portMappings":[
       {
       "hostPort": 80,
       "containerPort": 80,
       "protocol": "tcp"
        }
    ]
  }
]
DEFINITION
}
