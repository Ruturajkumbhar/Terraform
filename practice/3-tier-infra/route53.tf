
#  create hosted zone 

resource "aws_route53_zone" "main" {
  name = "ycloudhubonline.shop"
}

#  create records 


resource "aws_route53_record" "frontend_record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.cloudhubonline.shop"
  type    = "A"

  alias {
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
}

