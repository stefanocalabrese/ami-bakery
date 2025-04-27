<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| aws_access_key_id | AWS Access Key ID, it is assumed it is exported in your host env vars | `string` | `""` |
| aws_secret_access_key | AWS Secret Access Key, it is assumed it is exported in your host env vars | `string` | `""` |
| environment | The environment where we are deploying to | `string` | `"dev"` |
| region | The AWS Region | `string` | `"eu-central-1"` |
| sns | n/a | `map(any)` | <pre>{<br/>  "display_name": "packer-notifications",<br/>  "name": "packer-notifications"<br/>}</pre> |

## Modules

| Name | Source | Version |
|------|--------|---------|
| golden_ami | ../codebuild/ | n/a |

## Requirements

| Name | Version |
|------|---------|
| terraform | 1.9.7 |
| aws | ~> 5.1.0 |
| null | ~> 2.0 |
| random | ~> 3.4.3 |
| template | ~> 2 |

## Outputs

No outputs.

## Contacts:

Contact me on LinkedIn: https://www.linkedin.com/in/stefano-calabrese/
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->