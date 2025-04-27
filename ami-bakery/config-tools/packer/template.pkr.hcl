# Locals
locals {
 date     = formatdate("YYYYMMDDHHMM", timestamp())
 ami_name = "${var.component}-${local.date}"
}

# Plugins
packer {
 required_plugins {
   amazon = {
     source  = "github.com/hashicorp/amazon"
     version = "~> 1"
   }
   ansible = {
     source  = "github.com/hashicorp/ansible"
     version = ">= 1.1.1"
   }
 }
}

# Variables
# Uncomment if you want to share the AMI with another AWS Account
# variable "share_ami_with" {  
#  type    = list(string)
#  default = [
#    "123456789109",    
#  ]
# }

variable "ami_kms_key" {
 type    = string
 default = ""
}

variable "ansible_location" {
 type    = string
 default = ""
}

variable "bucket_name_suffix" {
 type    = string
 default = ""
}

variable "component" {
 type    = string
 default = ""
}

variable "environment" {
 type    = string
 default = ""
}

variable "hostname" {
 type    = string
 default = ""
}

variable "iam_instance_profile" {
 type    = string
 default = ""
}

variable "instance_type" {
 type    = string
 default = ""
}

variable "os_ami" {
 type    = string
 default = ""
}

variable "packer_sg" {
 type    = string
 default = ""
}

variable "region" {
 type    = string
 default = ""
}

variable "ssh_key_name" {
 type    = string
 default = ""
}

variable "tag_name" {
 type    = string
 default = ""
}

variable "user_data_file" {
 type    = string
 default = ""
}

variable "version" {
 type    = string
 default = ""
}

variable "volume_size" {
 type    = number
 default = 30
}

variable "vpc_id" {
 type    = string
 default = ""
}

variable "rdp_sg" {
 type    = string
 default = ""
}


# Build Template
source "amazon-ebs" "codebuild" {
 skip_create_ami = false

 source_ami_filter {
   filters = {
     "virtualization-type" = "hvm"
     "name"                = var.os_ami
     "root-device-type"    = "ebs"
   }
   owners      = ["801119661308"]
   most_recent = true
 }

 ami_block_device_mappings {
   device_name           = "/dev/sda1"
   delete_on_termination = true
   encrypted             = false
 }

 ami_name             = local.ami_name
 ami_description      = "Windows Server 2022 AMI created by Packer and Ansible"
 ami_users            = var.share_ami_with
 instance_type        = var.instance_type
 iam_instance_profile = var.iam_instance_profile
 ena_support          = true
 region               = var.region


 metadata_options {
   http_endpoint               = "enabled"
   http_tokens                 = "required"
   http_put_response_hop_limit = 1
 }

 user_data_file = var.user_data_file

 force_delete_snapshot = true

 launch_block_device_mappings {
   device_name           = "/dev/sda1"
   volume_type           = "gp3"
   volume_size           = var.volume_size
   delete_on_termination = true
   encrypted             = false
 }

 # Disable ephemeral instance store volumes
 launch_block_device_mappings {
   device_name = "/dev/xvdca"
   no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcc"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcd"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdce"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcf"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcg"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdch"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdci"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcj"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdck"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcl"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcm"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcn"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdco"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcp"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcq"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcr"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcs"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdct"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcu"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcv"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcw"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcx"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcy"
     no_device   = true
 }

 launch_block_device_mappings {
     device_name = "/dev/xvdcz"
     no_device   = true
 }

 communicator         = "ssh"
 ssh_username         = "administrator"
 ssh_timeout          = "20m"
 ssh_agent_auth       = false
 ssh_private_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
 ssh_keypair_name     = var.ssh_key_name
 ssh_interface        = "private_ip"

 vpc_id = var.vpc_id

 subnet_filter {
   filters = {
     "vpc-id"   = var.vpc_id
     "tag:Name" = "default-*"
   }
   most_free = true
   random    = false
 }

 security_group_filter {
   filters = {
     "group-name" = "${var.packer_sg}, ${var.rdp_sg}"
   }
 }

 aws_polling {
   max_attempts = 200
 }

 run_tags = {
   "Name" = var.tag_name
 }
}

build {
 sources = ["source.amazon-ebs.codebuild"]

 # Install N26 Public Certificates
 provisioner "ansible" {
   timeout           = "20m"
   ssh_host_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
   use_proxy         = false
   inventory_file    = "/home/ubuntu/ansible/inventories/aws_ec2.yaml"
   playbook_file     = "/home/ubuntu/ansible/playbooks/n26-public-certificates.yaml"
   ansible_env_vars  = ["ANSIBLE_CONFIG=/etc/ansible/ansible.cfg"]
 }

 # Enabling TLS 1.2 and 1.3
 provisioner "ansible" {
   timeout           = "20m"
   ssh_host_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
   use_proxy         = false
   inventory_file    = "/home/ubuntu/ansible/inventories/aws_ec2.yaml"
   playbook_file     = "/home/ubuntu/ansible/playbooks/enable-new-win-sec-protocols.yaml"
   ansible_env_vars  = ["ANSIBLE_CONFIG=/etc/ansible/ansible.cfg"]
 }

 # Disabling SSL, TLS 1.0 and 1.1
 provisioner "ansible" {
   timeout           = "20m"
   ssh_host_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
   use_proxy         = false
   inventory_file    = "/home/ubuntu/ansible/inventories/aws_ec2.yaml"
   playbook_file     = "/home/ubuntu/ansible/playbooks/disable-old-win-sec-protocols.yaml"
   ansible_env_vars  = ["ANSIBLE_CONFIG=/etc/ansible/ansible.cfg"]
 }

 # Windows Hardening
 provisioner "ansible" {
   timeout           = "20m"
   ssh_host_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
   use_proxy         = false
   inventory_file    = "/home/ubuntu/ansible/inventories/aws_ec2.yaml"
   playbook_file     = "/home/ubuntu/ansible/playbooks/win-hardening.yaml"
   ansible_env_vars  = ["ANSIBLE_CONFIG=/etc/ansible/ansible.cfg"]
 }

 # Configure Amazon NTP
 provisioner "ansible" {
   timeout           = "20m"
   ssh_host_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
   use_proxy         = false
   inventory_file    = "/home/ubuntu/ansible/inventories/aws_ec2.yaml"
   playbook_file     = "/home/ubuntu/ansible/playbooks/ntp.yaml"
   ansible_env_vars  = ["ANSIBLE_CONFIG=/etc/ansible/ansible.cfg"]
 }

 # Show Files Extensions and Hidden Folders
 provisioner "ansible" {
   timeout           = "20m"
   ssh_host_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
   use_proxy         = false
   inventory_file    = "/home/ubuntu/ansible/inventories/aws_ec2.yaml"
   playbook_file     = "/home/ubuntu/ansible/playbooks/show-file-ext-hidden-folders.yaml"
   ansible_env_vars  = ["ANSIBLE_CONFIG=/etc/ansible/ansible.cfg"]
 }

 # Enabling Dark Theme
 provisioner "ansible" {
   timeout           = "20m"
   ssh_host_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
   use_proxy         = false
   inventory_file    = "/home/ubuntu/ansible/inventories/aws_ec2.yaml"
   playbook_file     = "/home/ubuntu/ansible/playbooks/enable-dark-theme.yaml"
   ansible_env_vars  = ["ANSIBLE_CONFIG=/etc/ansible/ansible.cfg"]
 }

 # Apply Custom Security Baseline
  provisioner "ansible" {
   timeout           = "20m"
   ssh_host_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
   use_proxy         = false
   inventory_file    = "/home/ubuntu/ansible/inventories/aws_ec2.yaml"
   playbook_file     = "/home/ubuntu/ansible/playbooks/apply-sec-baseline.yaml"
   ansible_env_vars  = ["ANSIBLE_CONFIG=/etc/ansible/ansible.cfg"]
 }

 # Re-enable UAC to not allow elevated priviledges from remote shells
 provisioner "ansible" {
   timeout           = "20m"
   ssh_host_key_file = "/home/ubuntu/${var.ssh_key_name}.pem"
   use_proxy         = false
   inventory_file    = "/home/ubuntu/ansible/inventories/aws_ec2.yaml"
   playbook_file     = "/home/ubuntu/ansible/playbooks/win-uac-renforcement.yaml"
   ansible_env_vars  = ["ANSIBLE_CONFIG=/etc/ansible/ansible.cfg"]
 }

 # Sysprep
 provisioner "powershell" {
   timeout = "90m"
   inline = [
     "Stop-Service -Name wuauserv",
     "& 'C:\\Program Files\\Amazon\\EC2Launch\\ec2launch.exe' reset --block",
     "& 'C:\\Program Files\\Amazon\\EC2Launch\\ec2launch.exe' sysprep --block",
   ]
 }
}
