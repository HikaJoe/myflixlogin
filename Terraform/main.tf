# Define your AWS provider configuration
provider "aws" {
  region = "us-east-1"
}

# Define the instance types and storage sizes
variable "instance_type" {
  default = "t2.micro"
}

variable "login_size" {
  default = 10
}

variable "jenkins_size" {
  default = 20
}

variable "videosfront_size" {
  default = 20
}

variable "db_size" {
  default = 30
}

# Create Elastic IPs
resource "aws_eip" "login" {
}

resource "aws_eip" "jenkins" {
}

resource "aws_eip" "videosfront" {
}

resource "aws_eip" "db" {
}

# Launch EC2 instances
resource "aws_instance" "login" {
  ami           = "ami-0005e0cfe09cc9050" # Replace with the appropriate Amazon Linux AMI ID
  instance_type = var.instance_type
  key_name      = "mykeypair" # Replace with your SSH key pair name
 
 root_block_device {
    volume_size = var.login_size
  }

  tags = {
    Name = "login-i"
  }
}

resource "aws_instance" "jenkins" {
  ami           = "ami-0005e0cfe09cc9050" # Replace with the appropriate Amazon Linux AMI ID
  instance_type = var.instance_type
  key_name      = "mykeypair" # Replace with your SSH key pair name
  
   root_block_device {
    volume_size = var.jenkins_size
  }

  tags = {
    Name = "jenkins-i"
  }
}

resource "aws_instance" "videosfront" {
  ami           = "ami-0005e0cfe09cc9050" # Replace with the appropriate Amazon Linux AMI ID
  instance_type = var.instance_type
  key_name      = "mykeypair" # Replace with your SSH key pair name
  
    root_block_device {
     volume_size = var.videosfront_size
      }

  tags = {
    Name = "videosfront-i"
  }
}

resource "aws_instance" "db" {
  ami           = "ami-0005e0cfe09cc9050" # Replace with the appropriate Amazon Linux AMI ID
  instance_type = var.instance_type
  key_name      = "mykeypair" # Replace with your SSH key pair name
  
    root_block_device {
     volume_size = var.db_size
      }
      
  tags = {
    Name = "db-i"
  }
}
