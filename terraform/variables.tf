variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "dr-demo-rds-instance"
}

variable "db_username" {
  description = "RDS database master username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "RDS database master password"
  type        = string
  default     = "P@ssw0rd123"
  sensitive   = true
}

variable "db_allocated_storage" {
  description = "Allocated storage (in GB) for the RDS instance"
  type        = number
  default     = 20
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "domain_name" {
  description = "The domain name managed in Route 53 for failover"
  type        = string
  default     = "example.com"
}

variable "primary_alias" {
  description = "The alias for the primary environment (e.g., app.example.com)"
  type        = string
  default     = "app.example.com"
}

variable "dr_alias" {
  description = "The alias for the DR environment (e.g., dr-app.example.com)"
  type        = string
  default     = "dr-app.example.com"
}

variable "primary_origin" {
  description = "The origin domain for the primary CloudFront distribution"
  type        = string
  default     = "primary.example.com"   # Replace with your primary application endpoint
}

variable "dr_origin" {
  description = "The origin domain for the DR CloudFront distribution"
  type        = string
  default     = "dr.example.com"        # Replace with your DR application endpoint
}
