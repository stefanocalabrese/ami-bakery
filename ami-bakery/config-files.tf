resource "aws_ssm_parameter" "ansible_cfg_windows" {
 name        = "/packer/ansible_windows/ansible.cfg"
 type        = "String"
 description = "Ansible Config file for Windows"
 value = templatefile(
   "${path.module}/ansible/windows/configs/ansible_windows.cfg",
   {}
 )
}

resource "aws_ssm_parameter" "aws_ec2_plugin_windows" {
 name        = "/packer/ansible_windows/aws_ec2.yaml"
 type        = "String"
 description = "Ansible plugin for dynamic inventory on ec2 tag for Windows"
 value = templatefile(
   "${path.module}/ansible/windows/configs/aws_ec2.yaml",
   {}
 )
}

resource "aws_ssm_parameter" "openssl_config" {
 name        = "/ansible_windows/openssl.cnf"
 type        = "String"
 description = "Openssl Config file for Windows Certificate with Client Authentication"
 value = templatefile(
   "${path.module}/ansible/windows/configs/openssl.cnf.tpl",
   {}
 )
}

resource "aws_ssm_parameter" "ec2launch_agent_config" {
 name        = "/packer/ansible_windows/agent-config.yml"
 type        = "String"
 description = "EC2Launchv2 Agent Config file for Sysprep Windows"
 value = templatefile(
   "${path.module}/config-tools/packer/files/agent-config.yml.tpl",
   {}
 )
}

# For reference, in case you want to store the unattend.xml in the parameter store.
# In this case, to avoid costs due to the advanced tier, I decided to create a S3 bucket object.
# resource "aws_ssm_parameter" "unattend_xml" {
#  name        = "/ansible_windows/unattend.xml"
#  type        = "String"
#  description = "Unattend.xml file for Sysprep Windows"
#  value = templatefile(
#    "${path.module}/config-tools/packer/files/unattend.xml.tpl",
#    {}
#  )

#  # Set the parameter to Advanced tier due to the number of characters,
#  # This will increase the cost of the service.
#  tier = "Advanced"
# }

resource "aws_s3_bucket_object" "unattend_xml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "config/unattend.xml"
  source = "${path.module}/config-tools/packer/files/unattend.xml"
  etag   = filemd5("${path.module}/config-tools/packer/files/unattend.xml")
}

resource "aws_s3_bucket_object" "wallpaper" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "config/wallpaper.jpg"
  source = "${path.module}/config-tools/packer/files/wallpaper.jpg"
  etag   = filemd5("${path.module}/config-tools/packer/files/wallpaper.jpg")
}

resource "aws_s3_bucket_object" "sec_baseline" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "lgpo/sec_baseline_ws2022.zip"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/sec_baseline_ws2022.zip"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/sec_baseline_ws2022.zip")
}

resource "aws_s3_bucket_object" "lgpo" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "lgpo/lgpo.exe"
  source = "${path.module}/config-tools/packer/files/lgpo.exe"
  etag   = filemd5("${path.module}/config-tools/packer/files/lgpo.exe)
}
