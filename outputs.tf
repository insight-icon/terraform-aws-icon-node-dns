output "public_fqdn" {
  value = aws_route53_record.public.fqdn
}

output "private_fqdn" {
  value = aws_route53_record.private.fqdn
}

