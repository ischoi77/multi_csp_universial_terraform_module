# Subnet 생성 모듈

이 모듈은 다수의 AWS Subnet 을 동시에 생성하도록 구성한 Terraform 모듈이다.  
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
| <a name="input_subnets"></a> [subnets](#input\_subnets) | 서브넷 생성에 필요한 변수 (map(object) 타입) | <pre>map(object({<br/>    # vpc_id와 vpc_name 둘 다 선택적으로 입력할 수 있으며,<br/>    # 둘 다 있을 경우 vpc_id 값을 우선 사용함<br/>    vpc_id                          = optional(string)<br/>    vpc_name                        = optional(string)<br/>    cidr_block                      = string<br/>    availability_zone               = string<br/>    map_public_ip_on_launch         = optional(bool)<br/>    assign_ipv6_address_on_creation = optional(bool)<br/>    ipv6_cidr_block                 = optional(string)<br/>    tags                            = optional(map(string))<br/>    route_table_id                  = optional(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_vpc_ids"></a> [vpc\_ids](#input\_vpc\_ids) | VPC ID 맵. 각 서브넷에 직접 입력된 vpc\_id가 없을 경우, vpc\_name 값으로 조회하여 사용 (예: module.<module\_name>.vpc\_ids) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | 생성된 서브넷 ID (다른 모듈에서 사용 가능) |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route_table_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

[1]: #overview
[2]: #example-input
[3]: #requirements
[4]: #inputs
[5]: #outputs
[6]: #modules
[7]: #resources
