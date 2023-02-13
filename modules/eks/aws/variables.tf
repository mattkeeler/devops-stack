variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster."
  type        = string
  default     = "1.24"
}

variable "base_domain" {
  description = "The base domain used for Ingresses."
  type        = string
  default     = null
}

variable "other_domains" {
  description = "Other domains used for Ingresses requiring a DNS-01 challenge for Let's Encrypt validation with cert-manager (e.g. wildcard certificates)."
  type        = list(string)
  default     = []
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "vpc_id" {
  description = "VPC where the cluster and workers will be deployed."
  type        = string
}

variable "aws_auth_roles" {
  description = "List of role maps to add to the aws-auth configmap"
  type        = list(any)
  default     = []
}

variable "aws_auth_users" {
  description = "List of user maps to add to the aws-auth configmap"
  type        = list(any)
  default     = []
}

variable "aws_auth_accounts" {
  description = "List of account maps to add to the aws-auth configmap"
  type        = list(any)
  default     = []
}

variable "eks_managed_node_groups" {
  description = "Map of EKS managed node group definitions to create"
  type        = any
  default     = {}
}

variable "eks_managed_node_group_defaults" {
  description = "Map of EKS managed node group default configurations"
  type        = any
  default = {
    ami_type       = "AL2_x86_64"
    instance_types = ["m5d.large"]
  }
}

variable "cognito_user_pool_id" {
  description = "ID of the Cognito user pool to use."
  type        = string
  default     = null
}

variable "cognito_user_pool_domain" {
  description = "Domain prefix of the Cognito user pool to use (custom domain currently not supported!)."
  type        = string
  default     = null
}

variable "enable_efs" {
  description = "Whether to provision an EFS filesystem, along with a provisioner"
  type        = bool
  default     = false
}

variable "create_public_nlb" {
  description = "Whether to create an internet-facing NLB attached to the public subnets"
  type        = bool
  default     = true
}

variable "create_private_nlb" {
  description = "Whether to create an internal NLB attached the private subnets"
  type        = bool
  default     = false
}

variable "enable_cluster_autoscaler" {
  description = "Whether to setup a cluster autoscaler"
  type        = bool
  default     = false
}

variable "extra_lb_target_groups" {
  description = "Additional load-balancer target groups"
  type        = list(any)
  default     = []
}

variable "extra_lb_http_tcp_listeners" {
  description = "Additional load-balancer listeners"
  type        = list(any)
  default     = []
}
