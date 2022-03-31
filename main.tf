terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.1.0"
      #configuration_aliases = [ aws.alternate ]
    }
  }
  required_version = "~>1.1.0"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "ireland"
}

provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}

provider "aws" {
  region = "eu-west-3"
  alias  = "paris"
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "ubuntu-ireland" {
  provider = aws.ireland
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ubuntu-paris" {
  provider = aws.paris
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ubuntu-london" {
  provider = aws.london
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_security_group" "sg_krasteki-ireland" {
  provider = aws.ireland
  vpc_id = "vpc-87544ae1"
  name   = "terraform-learn-2regions-sg"
  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example-ireland" {
  provider = aws.ireland
  subnet_id              = "subnet-90e673ca"
  ami                    = data.aws_ami.ubuntu-ireland.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg_krasteki-ireland.id]
  user_data              = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Name = "krasteki"
  }
}






resource "aws_security_group" "sg_krasteki-paris" {
provider = aws.paris
  vpc_id = "vpc-d22627bb"
  name   = "terraform-learn-2regions-sg"
  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example-paris" {
  provider = aws.paris
  subnet_id = "subnet-c14fc78c"

  ami                    = data.aws_ami.ubuntu-paris.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg_krasteki-paris.id]
  user_data              = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Name = "krasteki"
  }
}




resource "aws_security_group" "sg_krasteki-london" {
provider = aws.london
  vpc_id = "vpc-60e19608"
  name   = "terraform-learn-2regions-sg"
  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example-london" {
  provider = aws.london
  subnet_id              = "subnet-dacf0496"
  ami                    = data.aws_ami.ubuntu-london.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg_krasteki-london.id]
  user_data              = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Name = "krasteki"
  }
}