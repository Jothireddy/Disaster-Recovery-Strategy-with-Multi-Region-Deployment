output "rds_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.rds_instance.address
}

output "primary_cloudfront_domain" {
  description = "Domain name of the primary CloudFront distribution"
  value       = aws_cloudfront_distribution.primary_cf.domain_name
}

output "dr_cloudfront_domain" {
  description = "Domain name of the DR CloudFront distribution"
  value       = aws_cloudfront_distribution.dr_cf.domain_name
}

output "route53_primary_record" {
  description = "Route53 record (Primary) for failover"
  value       = aws_route53_record.primary_record.fqdn
}
