module "vpcs" {
    source = "./modules/aws/vpcs"
    location = var.location
    common_tags = var.common_tags
    vpcs = var.vpcs
}

module "subnets" {
    source = "./modules/aws/subnets"
    location = var.location
    common_tags = var.common_tags
    subnets = var.subnets
    vpc_ids = module.vpcs.vpc_ids # vpc 모듈에서 vpc_id 정보 가져오기
}