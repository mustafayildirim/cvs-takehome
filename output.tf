# outputs.tf

output "alb_hostname" {
  value = aws_alb.cvs_dev_test_staging.dns_name
}

output "aws_eip_gw" {
  value = aws_eip.gw.*.public_ip
}

output "aws_nat_gateway_gw_public_ip" {
  value = aws_nat_gateway.gw.*.public_ip
}
