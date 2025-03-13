# Resource Group 생성시 기존 내용 확인하여 빠진 것만 생성 하도록 충돌 회피하는 resource_group 생성 모듈

#######################################
# 1. 모듈 대상 resource_group 목록 계산
#######################################


locals {
  # tfvar 파일의 map의 key가 모듈에서 관리할 resource_group 이름입니다.
  desired_rg_names = keys(var.resource_groups)
}

#######################################
# 2. 이미 존재하는 resource_group 조회 (missing 판단용)
#######################################
data "azurerm_resources" "existing_rgs" {
  type = "Microsoft.Resources/resourceGroups"
}


locals {
  # data.azurerm_resources.existing_rgs.resources 에서 resource_group 이름만 추출
  existing_rg_names = [
    for r in data.azurerm_resources.existing_rgs.resources : r.name
  ]
  
  # 생성할 필요가 있는 resource_group (원하는 그룹 중 아직 존재하지 않는 경우)
  rgs_to_create = setsubtract(local.desired_rg_names, local.existing_rg_names)
}

#######################################
# 3. 누락된 resource_group 생성
#######################################

resource "azurerm_resource_group" "create_missing" {
    for_each = local.rgs_to_create

    name     = each.value
    location = var.location

    tags = merge(each.value.tags, var.common_tags)
}

# resource "azurerm_resource_group" "resource_group" {
#     for_each = var.resource_groups
#     name = each.key
#     location = var.location
#     tags = merge(each.value.tags, var.common_tags)
# }
