output "module_resource_groups" {
  description = "모듈에서 관리하는 모든 resource_group 정보 (이미 존재하는 그룹과 새로 생성된 그룹 모두)"
  value = {
    for rg_key, rg_data in data.azurerm_resource_group.managed :
    rg_key => {
      id       = rg_data.id
      name     = rg_data.name
      location = rg_data.location
    }
  }
}
