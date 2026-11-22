output "s3_bucket" {
  description = "Valor para a variável S3_BUCKET do GitHub"
  value       = aws_s3_bucket.site.bucket
}

output "cloudfront_distribution_id" {
  description = "Valor para a variável CLOUDFRONT_DISTRIBUTION_ID do GitHub"
  value       = aws_cloudfront_distribution.site.id
}

output "deploy_role_arn" {
  description = "Valor para a variável AWS_ROLE_ARN do GitHub"
  value       = aws_iam_role.deploy.arn
}

output "acm_validation_records" {
  description = "CNAME a criar no painel da Hostinger para validar o certificado"
  value = [
    for dvo in aws_acm_certificate.site.domain_validation_options : {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  ]
}

output "cloudfront_domain_name" {
  description = "Destino do ALIAS (@) e CNAME (www) no Hostinger"
  value       = aws_cloudfront_distribution.site.domain_name
}
