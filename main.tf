data "aws_region" "this" {}

locals {
  public_dns = join(".", [
    var.hostname,
    data.aws_region.this.name])

  private_dns = join(".", [
    var.hostname,
    data.aws_region.this.name])
}

data "aws_route53_zone" "public_root_zone" {
  count = var.public_zone_id == "" ? 1 : 0
  name = "${var.domain_name}."
}

data "aws_route53_zone" "private_root_zone" {
  count = var.private_zone_id == "" ? 1 : 0
  name = "${var.internal_domain_name}."
  private_zone = true
}

resource "aws_route53_record" "public" {
  count = var.public_ip == "" || var.public_ips == "" ? 0 : 1

  zone_id = var.public_zone_id == "" ? data.aws_route53_zone.public_root_zone.*.id[0] : var.public_zone_id

  name = local.public_dns
  type = "A"

  ttl = "30"
  records = var.public_ip == "" ? var.public_ips : [var.public_ip]
}

resource "aws_route53_record" "private" {
  count = var.private_ip == "" || var.private_ips == "" ? 0 : 1

  zone_id = var.private_zone_id == "" ? data.aws_route53_zone.private_root_zone.*.id[0] : var.private_zone_id

  name = local.private_dns
  type = "A"

  ttl = "30"
  records = var.private_ip == "" ? var.private_ips : [var.private_ip]
}

