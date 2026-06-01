module "root_testmay26" {
  source = "git::https://github.com/aumthakkar/eks-testmay26.git"

  vpc_cidr    = "10.0.0.0/16"
  name_prefix = "pht-dev"

  vpc_region = var.vpc_region

  public_subnet_count  = 2
  private_subnet_count = 2

  auto_create_public_cidr   = true
  manual_public_cidr_block  = []
  auto_create_private_cidr  = true
  manual_private_cidr_block = []

  public_access_cidrs = ["0.0.0.0/0"]

  eks_endpoint_private_access = true
  eks_endpoint_public_access  = true

  cluster_service_ipv4_cidr = "172.20.0.0/16"


  nodegroup_ami_type       = "AL2023_ARM_64_STANDARD"
  nodegroup_instance_types = ["t4g.medium"]

  nodegroup_capacity_type = "ON_DEMAND"
  nodegroup_disk_size     = 20

  desired_nodegroup_size = 1
  max_nodegroup_size     = 2
  min_nodegroup_size     = 1

  max_unavailable_percentage = 50

  create_ebs_csi_driver = true
  create_efs_csi_driver = true
  create_cw_obs_driver  = true
  create_lbc_driver     = true

}

