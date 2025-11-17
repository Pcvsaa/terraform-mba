variable "subnet_ids" {}
variable "sg_id" {}

resource "aws_instance" "web" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[0]
  vpc_security_group_ids = [var.sg_id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              echo "<h1>Bem-vindo ao meu site!</h1>" > /var/www/html/index.html
              systemctl start apache2
              EOF

  tags = {
    Name = "WebServer"
  }
}
