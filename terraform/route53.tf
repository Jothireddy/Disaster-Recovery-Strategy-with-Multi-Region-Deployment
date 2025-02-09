# Data source for the Route 53 hosted zone
data "aws_route53_zone" "primary_zone" {
  name         = var.domain_name
  private_zone = false
}

# Create a health check for the primary CloudFront distribution
resource "aws_route53_health_check" "primary_hc" {
  fqdn                           = aws_cloudfront_distribution.primary_cf.domain_name
  port                           = 80
  type                           = "HTTP"
  resource_path                  = "/index.html"
  request_interval               = 30
  failure_threshold              = 3
}

# Primary record: points to the primary CloudFront distribution
resource "aws_route53_record" "primary_record" {
  zone_id = data.aws_route53_zone.primary_zone.zone_id
  name    = var.primary_alias
  type    = "A"

  set_identifier = "Primary"
  failover       = "PRIMARY"

  alias {
    name                   = aws_cloudfront_distribution.primary_cf.domain_name
    zone_id                = aws_cloudfront_distribution.primary_cf.hosted_zone_id
    evaluate_target_health = true
  }

  health_check_id = aws_route53_health_check.primary_hc.id
}

# Secondary (DR) record: used when the primary fails
resource "aws_route53_record" "dr_record" {
  zone_id = data.aws_route53_zone.primary_zone.zone_id
  name    = var.primary_alias  # Typically the same DNS name
  type    = "A"

  set_identifier = "Secondary"
  failover       = "SECONDARY"

  alias {
    name                   = aws_cloudfront_distribution.dr_cf.domain_name
    zone_id                = aws_cloudfront_distribution.dr_cf.hosted_zone_id
    evaluate_target_health = false
  }
}
