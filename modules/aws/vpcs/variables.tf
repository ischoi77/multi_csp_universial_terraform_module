variable "vpcs" {
  type = map(object({
    cidr_block                       = string
    assign_generated_ipv6_cidr_block = optional(bool, false)
    enable_dns_support               = optional(bool, true)
    enable_dns_hostnames             = optional(bool, false)
    instance_tenancy                 = optional(string, "default")
    tags                             = optional(map(string), {})
    additional_cidrs                 = optional(list(string), [])
  }))
  description = "각 VPC 생성에 필요한 설정 값들을 담은 map(object) 변수. key는 리소스 이름"
}

variable "location" {
  type        = string
  description = "리전 정보 (위치)"
}

variable "common_tags" {
  type        = map(string)
  description = "공용 태그로 각 리소스별 개별 tags와 병합"
}
