resource "aws_instance" "demoinstance" {
  ami = "ami-0a699202e5027c10d"

  instance_type = "t2.micro"

  count = 1

  key_name = "Shivam-key"

  vpc_security_group_ids = [aws_security_group.demosg.id]

  subnet_id = aws_subnet.public-subnet-1.id

  associate_public_ip_address = true

  user_data = file("data.sh")

  tags = {
    Name = "My public instance 1"
  }
}

#keypair
resource "aws_key_pair" "deployer" {
  key_name   = "Shivam-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}


#Creating 2nd EC2 instance in public subnet:


resource "aws_instance" "demoinstance1" {
  ami = "ami-0a699202e5027c10d"

  instance_type = "t2.micro"

  count = 1

  key_name = "Shivam-key"

  vpc_security_group_ids = [aws_security_group.demosg.id]

  subnet_id = aws_subnet.public-subnet-2.id

  associate_public_ip_address = true

  user_data = file("data.sh")

  tags = {
    Name = "My public instance 2"
  }
}
