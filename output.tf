#Create outputs.tf file 
#Create outputs.tf file

#Getting the DNS of the load balancer

output "lb_dns_name" {

  description = "The DNS name of the load balancer"

  value = "aws_lb.external_alb.dns_name"

}
