
resource "aws_route53_record" "expense" {
    count = length(var.instance_names)
    zone_id = var.zone_id
    name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
    #name    = local.record_name
    type    = "A"
    ttl     = 1
    #records = local.record_value
    records = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
    allow_overwrite = true
}



# Count and count.index will work only when the count module is set in local. So  that meant Count and count.index will not work on locals

# The "count" object can only be used in "module", "resource", and "data" blocks, and only when the "count" argument is set.