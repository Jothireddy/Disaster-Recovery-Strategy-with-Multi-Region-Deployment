resource "aws_cloudfront_distribution" "primary_cf" {
  origin {
    domain_name = var.primary_origin
    origin_id   = "PrimaryOrigin"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Primary CloudFront Distribution"
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = "PrimaryOrigin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_cloudfront_distribution" "dr_cf" {
  origin {
    domain_name = var.dr_origin
    origin_id   = "DROrigin"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "DR CloudFront Distribution"
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = "DROrigin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
