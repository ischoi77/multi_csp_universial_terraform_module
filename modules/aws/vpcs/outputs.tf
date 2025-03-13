output "vpc_ids" {
  description = "생성된 각 VPC의 ID (리소스 이름을 key로 사용)"
  value       = { for name, vpc in aws_vpc.this : name => vpc.id }
}
