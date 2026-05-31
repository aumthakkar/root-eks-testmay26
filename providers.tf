provider "aws" {
  region = "eu-north-1"

  alias = "aws"
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = module.root_testmay26.cluster_name
}

provider "helm" {
  kubernetes = {
    host                   = aws_eks_cluster.my_eks_cluster.endpoint
    cluster_ca_certificate = base64decode(module.root_testmay26.cluster_ca_certificate)
    token                  = data.aws_eks_cluster_auth.eks_cluster_auth.token
  }
}