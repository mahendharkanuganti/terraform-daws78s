resource "aws_instance" "test-ec2" {
    ami = "ami-090252cbe067a9e58"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
        name = "test-ec2-1"
    }
  
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "to allow access to ssh from 22 port"

    egress {
    from_port        = 0 # from any port
    to_port          = 0 #to any port
    protocol         = "-1"  # allow all protocols
    cidr_blocks      = ["0.0.0.0/0"] #from any internet
    }
  
    ingress {
    from_port        = 22  # allow 22 port
    to_port          = 22  # allow 22 port
    protocol         = "tcp"  # allow tcp protocols
    cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "mahi"
        
    }
}