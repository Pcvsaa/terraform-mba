output "site_dns" {
  value = aws_route53_record.app.fqdn
}

output "alb_dns" {
  value = aws_lb.alb.dns_name
}
