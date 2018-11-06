# Terraform AWS Bastion module
Creates an auto-scaled, self healing, Bastion server for use in AWS. The Bastion server will update its own DNS ( Route 53 ) record if a new server is created. 

#####Standard items created:

 * Bastion Server.
 * Auto scaling group "ASG" to create the Bastion Server.
 * Standard tags added to resources: Name, environment, orchestration.

#####Optional items:

 * ASG action notifications.

#####Current supported Operating Systems:

 * Ubuntu 16

#####Assumptions:

 * It is assumed the Bastion will be launched in a public subnet.


