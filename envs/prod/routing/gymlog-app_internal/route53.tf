resource "aws_service_discovery_private_dns_namespace" "this" {
  name = "gymlog-app.internal"
  vpc  = data.terraform_remote_state.network_main.outputs.vpc_this_id
}

resource "aws_service_discovery_service" "this" {
  name = "pplmtv"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.this.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_route53_zone" "this" {
  name = "gymlog-db.internal"
  vpc {
    vpc_id = data.terraform_remote_state.network_main.outputs.vpc_this_id
  }
}

resource "aws_route53_record" "db_cname" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "db.${aws_route53_zone.this.name}"
  type    = "CNAME"
  ttl     = 300
  records = [
    data.terraform_remote_state.db_gymlog-app.outputs.db_instance_this_address
  ]
}

/*
resource "aws_route53_record" "cache_cname" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "cache.${aws_route53_zone.this.name}"
  type    = "CNAME"
  ttl     = 300
  records = [
    data.terraform_remote_state.cache_gymlog-app.outputs.elasticache_replication_group_this_primary_endpoint_address
  ]
}
*/