resource "aws_secretsmanager_secret" "infraview_store" {
  name        = "infraview/break"
  description = "Secret store for InfraView server data"
}
