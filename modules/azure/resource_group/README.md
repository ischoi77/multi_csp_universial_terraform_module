# Resource Group 생성 모듈 (마이그레이션용 버전)

이 모듈은 다수의 Azure Resource Group 을 동시에 생성하도록 구성한 Terraform 모듈로  
현재 존재하는 Resource Group 정보를 확인하여 존재하지 않는 Resource Group만 생성하도록 동작한다.  
각 모듈은 개별적으로 동작하도록 구성되어 있으며 필요한 경우 모듈간 리소스 정보를 이용하도록  
output 을 사용하여 ID 정보를 출력하도록 구성되어 있다.

## Table of Contents

- [Overview][1]
- [Example Input][2]
- [Requirements][3]
- [Inputs][4]
- [Outputs][5]
- [Modules][6]
- [Resources][7]

## Overview



## Requirements

No requirements.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | 공용 tag 값 (모든 리소스에 적용) | `map(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | 리전 정보 (위치) | `string` | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | 관리할 resource\_group 이름 | <pre>map(object({<br/>        #location = string<br/>        tags = optional(map(string))<br/>    }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_resource_groups"></a> [module\_resource\_groups](#output\_module\_resource\_groups) | 모듈에서 관리하는 모든 resource\_group 정보 (이미 존재하는 그룹과 새로 생성된 그룹 모두) |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.create_missing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.managed](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resources.existing_rgs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resources) | data source |

[1]: #overview
[2]: #example-input
[3]: #requirements
[4]: #inputs
[5]: #outputs
[6]: #modules
[7]: #resources
