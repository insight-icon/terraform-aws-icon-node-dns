output "public_fqdn" {
  value = var.public_ip == "" ? "" : aws_route53_record.public.*.fqdn[0]
}

output "private_fqdn" {
  value = aws_route53_record.private.fqdn
}

