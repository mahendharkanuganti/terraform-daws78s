variable "instance_names" {
    type = map
    default = {
        db = "t3.micro"
        backend = "t2.micro"
        frontend = "t2.micro"
    }
}

variable "common_tags" {    # these names will appear in AWS ec2 resources under tags section.
    type = map
    default = {
        Project = "Expence"
        Terraform = "true"
    }
}

#R53 variables

variable "zone_id" {
    default = "Z09453352UCEVDC5QWJID"   # this is hosted zone ID in aws r53
}

variable "domain_name" {
    default = "mahidevops.cloud"    # this is the hostinger domain name
}
