resource "aws_security_group" "db_sg" {
  name_prefix = "rds-sg-"
  description = "Allow database access"

  ingress {
    description = "Allow access from ECS tasks"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}