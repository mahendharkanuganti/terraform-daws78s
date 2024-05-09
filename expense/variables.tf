
#ec2 intance variables

variable "instance_names" {
    default = ["db","backend","frontend"]
    type = list
    }

variable "image_id" {
    default = "ami-090252cbe067a9e58"
}

variable "instance_type" {
    default = "t2.micro"
}


variable "common_tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Terraform = "true"
    }
  
}

#sg variables

variable "ssh_port" {
    default = "22"
}

variable "protocol" {
    default = "tcp"
}

variable "cidr_block" {
    default = ["0.0.0.0/0"]
}

variable "sg_name" {
    default = "allow_ssh"
  
}

variable "sg_description" {
    default = "To allow ssh ports"
  
}

#R53 variables

variable "zone_id" {
    default = "Z09453352UCEVDC5QWJID"
}

variable "domain_name" {
    default = "mahidevops.cloud"
}