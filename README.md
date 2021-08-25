<p align="center">
  <a href="https://www.cloud42.io/" target="_blank" rel="Homepage">
  <img width="200" height="200" src="https://www.cloud42.io/wp-content/uploads/2020/01/transparent_small.png">
  </a>
</p>

---
<p align="center">Need help with your Cloud builds <a href="https://www.cloud42.io/contact/" target="_blank" rel="ContactUS"> GET IN TOUCH</a>.</p>

---
# Terraform AWS Bastion module
Creates an auto-scaled, self healing, Bastion server for use in AWS. The Bastion server will update its own DNS ( Route 53 ) record if a new server is created. 

##### Standard items created:

 * Bastion Server.
 * Auto scaling group "ASG" to create the Bastion Server.

##### Assumptions:

 * Bastion will be launched in a public subnet.
 * A VPC is already in place

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_topic\_arn | Topic ARN to send ASG event notifcations to | `string` | `null` | no |
| custom\_userdata | Set custom userdata | `string` | `""` | no |
| desired\_capacity | ASG desired size | `number` | `1` | no |
| dns\_domain\_name | DNS domain name the host will be part of. eg dev.domain.io | `string` | n/a | yes |
| ebs\_optimized | Sets ebs optimised for ec2 instance if required | `bool` | `true` | no |
| enable\_monitoring | Enables / disables detailed monitoring | `bool` | `false` | no |
| encrypted | Encrypt root volume | `bool` | `true` | no |
| environment | The environment the Bastion will be part of, eg, DEV, UAT or PROD | `string` | n/a | yes |
| health\_check\_grace\_period | Health check Grace period for ASG | `number` | `120` | no |
| health\_check\_type | n/a | `string` | `"EC2"` | no |
| hosted\_zone\_id | Variable for Hosted zone id, eg Z2XXOVXYYGMD12 | `string` | n/a | yes |
| hostname | n/a | `string` | `"bastion"` | no |
| iam\_policies | List of additional IAM policies to assign to the Bastion | `map(string)` | `{}` | no |
| image\_id | AMI to use | `string` | n/a | yes |
| instance\_type | ec2 instance type | `string` | `"t3a.micro"` | no |
| key\_name | SSH Key used to build the host | `string` | n/a | yes |
| max\_size | ASG maximum size | `number` | `1` | no |
| min\_size | ASG minimum size | `number` | `1` | no |
| notifications | Enable / Disable ASG Event notifications | `bool` | `false` | no |
| region | AWS region | `string` | n/a | yes |
| security\_groups | Security Group to associate with the ec2 instance | `string` | n/a | yes |
| tags | Tags to assign | `map(string)` | `{}` | no |
| volume\_size | instance Volume size | `number` | `10` | no |
| volume\_type | ec2 volume type | `string` | `"gp2"` | no |
| vpc\_zone\_identifier | A list of subnet IDs to launch the Bastion in | `list(string)` | n/a | yes |