resource "aws_secretsmanager_secret" "infraview_store" {
  name        = "infraview/secrets"
  description = "Secret store for InfraView server data"
}
