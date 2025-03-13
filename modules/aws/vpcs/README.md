# VPC 생성 모듈

이 모듈은 다수의 AWS VPC 를 동시에 생성하도록 구성한 Terraform 모듈이다.  
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
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | 공용 태그로 각 리소스별 개별 tags와 병합 | `map(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | 리전 정보 (위치) | `string` | n/a | yes |
| <a name="input_vpcs"></a> [vpcs](#input\_vpcs) | 각 VPC 생성에 필요한 설정 값들을 담은 map(object) 변수. key는 리소스 이름 | <pre>map(object({<br/>    cidr_block                       = string<br/>    assign_generated_ipv6_cidr_block = optional(bool, false)<br/>    enable_dns_support               = optional(bool, true)<br/>    enable_dns_hostnames             = optional(bool, false)<br/>    instance_tenancy                 = optional(string, "default")<br/>    tags                             = optional(map(string), {})<br/>    additional_cidrs                 = optional(list(string), [])<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_ids"></a> [vpc\_ids](#output\_vpc\_ids) | 생성된 각 VPC의 ID (리소스 이름을 key로 사용) |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_ipv4_cidr_block_association.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) | resource |

[1]: #overview
[2]: #example-input
[3]: #requirements
[4]: #inputs
[5]: #outputs
[6]: #modules
[7]: #resources
