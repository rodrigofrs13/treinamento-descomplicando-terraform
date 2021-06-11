data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]

  }

  owners = ["099720109477"] #Ubuntu

}

resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  depends_on = [
    aws_instance.foo
  ]

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
  }
}

resource "aws_instance" "foo" {
  instance_type = "t2.micro"
  ami           = "ami-0aeeebd8d2ab47354"
  tags = {
    Name        = "foo"
    Environment = var.env
    Provisioner = "Terraform"
  }
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.server.id

}
