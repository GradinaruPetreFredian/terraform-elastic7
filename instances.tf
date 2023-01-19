##################################################################################
# DATA
##################################################################################

data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

##################################################################################
# RESOURCES
##################################################################################

# INSTANCES #
resource "aws_instance" "ansible" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.ansible_instance_type
  subnet_id              = aws_subnet.my-subnet.id
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  key_name               = "ptd-am-petre.gradinaru-key"

  user_data = <<EOF
#! /bin/bash
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install ansible
ansible-galaxy collection install ansible.posix
EOF

  tags = merge(
    local.common_tags,
    {
      Name = "ansible"
    },
  )
}

resource "aws_instance" "elk1" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.elk_instance_type
  subnet_id              = aws_subnet.my-subnet.id
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  key_name               = "ptd-am-petre.gradinaru-key"

  user_data = <<EOF
#! /bin/bash
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum update
EOF

  tags = merge(
    local.common_tags,
    {
      Name = "elk1"
    },
  )
}

resource "aws_instance" "elk2" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.elk_instance_type
  subnet_id              = aws_subnet.my-subnet.id
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  key_name               = "ptd-am-petre.gradinaru-key"

  user_data = <<EOF
#! /bin/bash
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum update
EOF
  tags = merge(
    local.common_tags,
    {
      Name = "elk2"
    },
  )
}
resource "aws_instance" "elk3" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.elk_instance_type
  subnet_id              = aws_subnet.my-subnet.id
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  key_name               = "ptd-am-petre.gradinaru-key"

  user_data = <<EOF
#! /bin/bash
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum update
EOF
  tags = merge(
    local.common_tags,
    {
      Name = "elk3"
    },
  )
}
