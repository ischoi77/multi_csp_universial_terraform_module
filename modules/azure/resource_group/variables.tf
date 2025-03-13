variable "common_tags" {
    description = "공용 tag 값 (모든 리소스에 적용)"
    type = map(string)
}

variable "location" {
    description = "리전 정보 (위치)"
    type = string
}

variable "resource_groups" {
    description = "관리할 resource_group 이름"
    type = map(object({
        #location = string
        tags = optional(map(string))
    }))
}