variable "location" {
  type        = string
  description = "리전 정보 (위치)"
}

variable "common_tags" {
  type        = map(string)
  description = "공용 태그로 각 리소스별 개별 tags와 병합"
}


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

variable "subnets" {
  description = "서브넷 생성에 필요한 변수 (map(object) 타입)"
  type = map(object({
    # vpc_id와 vpc_name 둘 다 선택적으로 입력할 수 있으며,
    # 둘 다 있을 경우 vpc_id 값을 우선 사용함
    vpc_id                          = optional(string)
    vpc_name                        = optional(string)
    cidr_block                      = string
    availability_zone               = string
    map_public_ip_on_launch         = optional(bool)
    assign_ipv6_address_on_creation = optional(bool)
    ipv6_cidr_block                 = optional(string)
    tags                            = optional(map(string))
    route_table_id                  = optional(string)
  }))
}
