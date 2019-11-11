output "public_fqdn" {
  value = var.public_ip == "" ? "" : aws_route53_record.public.*.fqdn[0]
}

output "private_fqdn" {
  value = var.private_ip == "" || var.private_ips == [] ? "" : aws_route53_record.private.*.fqdn[0]
}
