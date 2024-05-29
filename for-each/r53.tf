resource "aws_route53_record" "expense" {
    for_each = aws_instance.expense
    zone_id = var.zone_id
    name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = true          # if records already exists, this fearture will override them.
}   


# for_each = aws_instance.expense
#     > here we are creating the for loop and for loop will fetch all the values from 'aws_instance.expense' which we given this in outputs.tf file. 
#     > that means outputs.tf file will store the ec2 instances details in 'aws_instance.expense' and here we fecth them.

# name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
#     >   here, we are directly using the for loop by specifying the 'each.key' parameter and each.value parameter