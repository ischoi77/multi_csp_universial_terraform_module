output "subnet_ids" {
  description = "생성된 서브넷 ID (다른 모듈에서 사용 가능)"
  value       = { for key, subnet in aws_subnet.this : key => subnet.id }
}
