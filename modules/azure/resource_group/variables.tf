variable "common_tags" {
    type = map(string)
}

variable "location" {
    type = string
}

variable "resource_groups" {
    type = map(object({
        #location = string
        tags = optional(map(string))
    }))
}