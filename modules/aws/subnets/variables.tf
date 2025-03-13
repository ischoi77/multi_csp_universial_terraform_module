variable "location" {
  description = "리전 정보 (위치)"
  type        = string
}

variable "common_tags" {
  description = "공용 tag 값 (모든 리소스에 적용)"
  type        = map(string)
}

variable "vpc_ids" {
  description = "VPC ID 맵. 각 서브넷에 직접 입력된 vpc_id가 없을 경우, vpc_name 값으로 조회하여 사용 (예: module.<module_name>.vpc_ids)"
  type        = map(string)
  default     = {}
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
