
resource "aws_instance" "example" {
  ami           = "ami-69f7b805"
  instance_type = "t2.micro"
  security_groups = [ "${aws_security_group.sg.id}" ]
  tags {
    Name = "${var.name}"
    Environment = "${var.environment}"
  }
}

# resource "aws_elb" "elb" {
#   name = "${var.name}"
#   security_groups = [ "${aws_security_group.sg.id}" ]
#   cross_zone_load_balancing = true
#   instances = ["${aws_instance.example.id}"]

#   listener {
#     instance_port = "80"
#     instance_protocol = "tcp"
#     lb_port = "80"
#     lb_protocol = "tcp"
#   }

#   health_check {
#     healthy_threshold = 2
#     unhealthy_threshold = 2
#     timeout = 3
#     target = "TCP:80"
#     interval = 5
#   }
#   tags {
#     Name = "${var.name}"
#     Environment = "${var.environment}"
#   }
# }

# resource "aws_security_group" "sg" {
#   name = "${var.name}-sg"
#   description = "Allow all inbound traffic"
#   ingress {
#       from_port = 22
#       to_port = 22
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#       from_port = 80
#       to_port = 80
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#       from_port = 0
#       to_port = 65535
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#   }
# }
