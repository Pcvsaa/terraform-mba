# 1. CRIA a Zona Hospedada (em vez de ler)
resource "aws_route53_zone" "main" {
  name = var.domain
}

# 2. CRIA o registro "www" (ou outro subdomínio)
resource "aws_route53_record" "app" {
  # Atualizado para usar o ID do *recurso* que acabamos de criar
  zone_id = resource.aws_route53_zone.main.zone_id

  name    = var.subdomain
  type    = "A"

  # Aponta para o seu Load Balancer usando Alias
  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}