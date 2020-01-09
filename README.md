<p align="center">
  <a href="https://www.cloud42.io/" target="_blank" rel="Homepage">
  <img width="200" height="200" src="https://www.cloud42.io/wp-content/uploads/2020/01/transparent_small.png">
  </a>
</p>

---
<p align="center">Need help with your Cloud builds <a href="https://www.cloud42.io/contact/" target="_blank" rel="ContactUS"> DROP US A LINE</a>.</p>

---
# Terraform AWS Bastion module
Creates an auto-scaled, self healing, Bastion server for use in AWS. The Bastion server will update its own DNS ( Route 53 ) record if a new server is created. 

##### Standard items created:

 * Bastion Server.
 * Auto scaling group "ASG" to create the Bastion Server.
 * Standard tags added to resources: Name, environment, orchestration.

##### Optional items:

 * ASG action notifications.

##### Current supported Operating Systems:

 * Amazon Linux 2 

##### Assumptions:

 * It is assumed the Bastion will be launched in a public subnet.
 * A VPC is already in place

##### Using the module

 * This module is usually called from a top level repository. Within this calling module the AWS provider needs to be defined. See provider.tf in the examples directory.
