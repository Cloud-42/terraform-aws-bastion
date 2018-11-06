# Terraform AWS Bastion module
Creates an auto-scaled, self healing, Bastion server for use in AWS. The Bastion server will update its own DNS ( Route 53 ) record if a new server is created. 

Standard items created:

 * Bastion Server.
 * Auto scaling group "ASG" to create the Bastion Server.

Optional items:

 * ASG action notifications.

