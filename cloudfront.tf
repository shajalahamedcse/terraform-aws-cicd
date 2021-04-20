resource "aws_cloudfront_distribution" "codepipeline" {
  depends_on = [
    aws_s3_bucket.static_web_bucket,
    aws_s3_bucket.artifacts_bucket,
    aws_codebuild_project.static_web_build,
    aws_codepipeline.static_web_pipeline,

  ]
  count = 1
  origin {
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }

    domain_name = aws_s3_bucket.static_web_bucket.website_endpoint
    origin_id   = "myS3Origin778877"
  }

  enabled             = true
  is_ipv6_enabled     = false
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "myS3Origin778877"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 84600
  }

  price_class = "PriceClass_All"

  viewer_certificate {
    cloudfront_default_certificate = true
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
