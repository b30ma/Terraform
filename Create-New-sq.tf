locals{
  variable "aws_region" {
  description = "AWS region where the security groups will be created."
  type        = string
  }

variable "name_prefix" {
  description = "Prefix for the name of the security groups."
  type        = string
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "public_sg" {
  name_prefix = local.var.name_prefix
  description = "Public Security Group"
  
  # Add your security group rules here
  # Example:
  ingress {
    description = "SSH"
    from_port   = < >
    to_port     = < >
    protocol    = "tcp"
    cidr_blocks = < >
  }
}

resource "aws_security_group" "private_sg" {
  name_prefix = local.var.name_prefix
  description = "Private Security Group"
  
  # Add your security group rules here
  # Example:
  ingress {
    description = "HTTP"
    from_port   = < >
    to_port     = < >
    protocol    = "tcp"
    cidr_blocks = < >
  }
}


# Use the security group module
module "security_groups" {
  source = "./security_group_module"
  
  aws_region = "us-east-1"  # Pass the AWS region to the module
  name_prefix = "my-project"  # Pass the name prefix to the module
}

# Use the security group IDs in your parent configuration as needed
resource "aws_instance" "example_instance" {
  ami           = <" ">
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    module.security_groups.public_security_group_id,
    module.security_groups.private_security_group_id,
  ]

  # Other instance configuration goes here
}

output "public_security_group_id" {
  description = "The ID of the public security group."
  value       = aws_security_group.public_sg.id
}

output "private_security_group_id" {
  description = "The ID of the private security group."
  value       = aws_security_group.private_sg.id
}
