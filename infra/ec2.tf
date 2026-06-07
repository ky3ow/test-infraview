resource "aws_instance" "infraview" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [aws_security_group.infraview.id]
  subnet_id              = data.aws_subnets.default.ids[0]
  iam_instance_profile   = aws_iam_instance_profile.infraview.name

  user_data = templatefile("${path.module}/provision.sh.tmpl", {
    secret_name = aws_secretsmanager_secret.infraview_store.name
  })
}
