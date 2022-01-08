resource "aws_route53_record" "www" {
  zone_id = "Z04237781VVRQLL67O73R"  # your zone_id
  name    = "cloudavengers.link"       #put your website name
  type    = "A"
  alias {
    name                   = aws_lb.my_alb_1.dns_name
    zone_id                = aws_lb.my_alb_1.zone_id
    evaluate_target_health = true
  }
}
