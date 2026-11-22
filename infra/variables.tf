variable "aws_region" {
  description = "Região principal (o certificado ACM do CloudFront precisa estar em us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Profile do AWS CLI usado pelo Terraform"
  type        = string
  default     = "homepage-s3"
}

variable "bucket_name" {
  description = "Nome do bucket S3 (globalmente único)"
  type        = string
}

variable "domain_name" {
  description = "Domínio raiz do site, ex: exemplo.com (o www. é adicionado automaticamente)"
  type        = string
}

variable "github_repo" {
  description = "Repositório no formato owner/repo"
  type        = string
}

variable "github_branch" {
  description = "Branch autorizada a fazer deploy"
  type        = string
  default     = "main"
}

variable "create_github_oidc_provider" {
  description = "Crie o provider OIDC do GitHub só se ele ainda não existir na conta"
  type        = bool
  default     = true
}
