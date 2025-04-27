resource "aws_ssm_parameter" "apply_sec_baseline" {
  name        = "/packer/ansible-playbooks/apply-sec-baseline.yaml"
  type        = "String"
  description = "Playbook to apply Windows CIS baseline via LocalGPO"
  value = templatefile(
    "${path.module}/config-tools/ansible/windows/playbooks/apply-sec-baseline.yaml",
    {}
  )
}
