<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| github_token | Sensitive token for Github | `string` | n/a |
| aws_access_key_id | AWS Access Key ID | `string` | `""` |
| aws_secret_access_key | AWS Secret Access Key | `string` | `""` |
| environment | The environment where we are deploying to | `string` | `"dev"` |
| region | The AWS Region | `string` | `"eu-central-1"` |
| sns | n/a | `map(any)` | <pre>{<br/>  "display_name": "ami-bakery-notifications",<br/>  "name": "ami-bakery-notifications"<br/>}</pre> |

## Modules

| Name | Source | Version |
|------|--------|---------|
| ami_baker | ../codebuild/ | n/a |

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