##################################################################################
# TERRAFORM VARIABLES
##################################################################################

variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "eu-west-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_subnet_cidr_block" {
  type        = string
  description = "CIDR Block for Subnet in VPC"
  default     = "10.0.0.0/24"
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "My Company"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
  default     = "Regional DevOps Academy"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "ansible_instance_type" {
  type        = string
  description = "Type for EC2 Instnace"
  default     = "t2.micro"
}

variable "elk_instance_type" {
  type        = string
  description = "Type for EC2 Instnace"
  default     = "t2.medium"
}
