# resource "aws_instance" "web" {
#   ami = "ami-0350cb31961bedf3f"
#   instance_type = "t2.micro"
#   subnet_id = module.vpc.public_subnets[0]
#   vpc_security_group_ids = [aws_security_group.ec2-nuxt.id]
#   tags =  {
#     Name = "ec2-nuxt"
#   }
# }

# resource "aws_security_group" "ec2-nuxt" {
#   name        = "ec2-nuxt-sg"
#   description = "Security group for ec2-nuxt server"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     description = "Allow all users to access"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     "Name"                                      = "ec2-nuxt-sg"
#   }
# }
