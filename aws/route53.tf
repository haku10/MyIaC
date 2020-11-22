resource "aws_route53_zone" "my-test" {
  name         = "xxxxx.jp."
}

resource "aws_acm_certificate" "my-acm-certificate" {
  domain_name       = "test.xxxxx.jp"
  validation_method = "DNS"
  tags = {
    "Name" = "${var.stage}-my-acm"
  }
}

resource "aws_route53_record" "my-cert-verify" {
  name    = "text.xxxxx.jp"
  type    = "A"
  zone_id = "${aws_route53_zone.my-test.id}"
  records = ["${aws_alb.my-alb.dns_name}"]
  ttl     = 300
}
