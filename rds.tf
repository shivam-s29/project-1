#Creating  RDS subnet Group
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-2.id]
  tags = {
    Name = "My DB Subnet Group"
  }
}

#Creating RDS Instance
resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.name
  engine                 = "mysql"
  engine_version         = "8.0.34"
  instance_class         = "db.t3.micro"
  multi_az               = "true"
  db_name                = "mydb"
  username               = "Admin"
  password               = "shivam29"
  skip_final_snapshot    = "true"
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}
