variable "ARGOCD_PASSWORD" {
  description = "The password for the Argo CD admin user"
  type        = string
  default     = "biswajit123"  # Change this!
  sensitive   = true
}