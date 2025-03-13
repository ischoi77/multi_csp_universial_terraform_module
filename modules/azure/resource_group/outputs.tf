#######################################
# 4. 최종 출력용: 각 resource_group 정보를 조회
#######################################
# 각 resource_group 이름을 key로 하여 별도의 데이터 소스를 생성합니다.
# 이 데이터 소스는 depends_on을 이용해 missing 그룹이 생성된 후에 조회되도록 합니다.
data "azurerm_resource_group" "managed" {
  for_each = var.resource_groups
  name     = each.key

  # resource 그룹이 새로 생성된 경우, 해당 생성이 완료된 후에 데이터를 읽도록 함
  depends_on = [azurerm_resource_group.create_missing]
}