resource "aws_instance" "expense" {
    for_each = var.instance_names   # each.key and each.value
    ami = data.aws_ami.ami_info.id
    instance_type = each.value
    vpc_security_group_ids = ["sg-06c77e5ebcb730f00"]
   
    tags = merge(
        var.common_tags,
        {
            Name = each.key
            Module = each.key
        }

    )
  
}


# variable "instance_names" {
#     type = map
#     default = {
#         db = "t3.micro"    >> here each.key = db and each.value = t3.micro
#         backend = "t2.micro"    >> here each.key = backend and each.value = t2.micro
#         frontend = "t2.micro"   >> here each.key = frontend and each.value = t2.micro
#     }
# }

