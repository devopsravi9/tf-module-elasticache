//in this we had redis type and memcache types we using redis one.

resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${local.TAG_PREFIX}-cluster"
  engine               = var.ELASTICACHE_ENGINE
  engine_version       = var.ELASTICACHE_ENGINE_VERSION
  node_type            = var.ELASTICACHE_INSTANCE_CLASS
  num_cache_nodes      = var.NUM_OF_NODES
  parameter_group_name = aws_elasticache_parameter_group.main.name
  security_group_ids   = [aws_security_group.main.id]
  subnet_group_name    = aws_elasticache_subnet_group.main.name
  port                 = var.ELASTICACHE_PORT
}