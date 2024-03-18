provider "aws" {
  region = "us-east-1"
}

module "dev_infra" {
  source = "./blueprint"

  /* -------------------------------------------------------------------------- */
  /*                             VPC configurations                             */
  /* -------------------------------------------------------------------------- */
  name     = "k3s_cluster"
  vpc_cidr = "10.0.0.0/16"


  /* -------------------------------------------------------------------------- */
  /*                        Public subnet configurations                        */
  /* -------------------------------------------------------------------------- */

  // Public subnet configurations
  public_subnet_variables = [{
    public_subnet_name              = "public_subnet_1"
    public_subnet_cidr_block        = "10.0.1.0/24"
    public_subnet_availability_zone = "us-east-1a"
    public_subnet_allow_public_ip   = true
    vpc_id                          = module.dev_infra.vpc_id_output
    vpc_name                        = module.dev_infra.vpc_name_output
  }]


  // Route table for public subnets
  aws_route_table_for_public_subnets = [{
    route_table_name = "public_route_table_1"
    vpc_id           = module.dev_infra.vpc_id_output
    routes = [
      {
        cidr_block = "10.0.0.0/16"
        gateway_id = "local"
      },
      {
        cidr_block = "0.0.0.0/0"
        gateway_id = module.dev_infra.vpc_gatway_id_output
      }
    ]
  }]


  /* -------------------------------------------------------------------------- */
  /*                        Private subnet configurations                       */
  /* -------------------------------------------------------------------------- */

  // Private subnet configurations
  private_subnet_variables = [{
    private_subnet_name              = "private_subnet_1"
    private_subnet_cidr_block        = "10.0.2.0/24"
    private_subnet_availability_zone = "us-east-1b"
    vpc_id                           = module.dev_infra.vpc_id_output
    vpc_name                         = module.dev_infra.vpc_name_output
    }
  ]


  // Route table for private subnets
  aws_route_table_for_private_subnets = [{
    route_table_name = "private_route_table_1"
    vpc_id           = module.dev_infra.vpc_id_output
    routes = [
      {
        cidr_block = "10.0.0.0/16"
        gateway_id = "local"
      },
      {
        cidr_block = "0.0.0.0/0"
        gateway_id = module.dev_infra.nat_gateway_id_output
      }
    ]
  }]


  /* -------------------------------------------------------------------------- */
  /*                        Security Group Configuration                        */
  /* -------------------------------------------------------------------------- */

  sg_details = [{
    sg_name                = "dev_sg"
    vpc_attachment_with_id = module.dev_infra.vpc_id_output
    ingress_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH from anywhere"
      },
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTP from anywhere"
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTPS from anywhere"
      },
      {
        from_port   = 6443
        to_port     = 6443
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
        description = "Allow traffic from VPC"
      },
      {
        from_port   = 2379
        to_port     = 2380
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
        description = "Allow traffic from other security group"
      },
      {
        from_port   = 8472
        to_port     = 8472
        protocol    = "udp"
        cidr_blocks = ["10.0.0.0/16"]
        description = "Allow traffic from VPC"
      },
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all traffic"
    }]
  }]


  /* -------------------------------------------------------------------------- */
  /*                        Key Pair Configuration                              */
  /* -------------------------------------------------------------------------- */
  key_pair_name  = "k3s_access_key"
  public_key_dir = "${path.module}/public_key.pub"

  /* -------------------------------------------------------------------------- */
  /*                        EC2 Instance Configuration                          */
  /* -------------------------------------------------------------------------- */


  ec2_instance = [
    {
      instance_name              = "bastion_host"
      instance_type              = "t2.micro"
      instance_key_name          = module.dev_infra.key_pair_name_output
      instance_allow_public_ip   = true
      instance_subnet_id         = module.dev_infra.public_subnet_id_output
      instance_security_group_id = [module.dev_infra.dev_sg_id_output]
    },
    {
      instance_name              = "nginx_server"
      instance_type              = "t2.micro"
      instance_key_name          = module.dev_infra.key_pair_name_output
      instance_allow_public_ip   = true
      instance_subnet_id         = module.dev_infra.public_subnet_id_output
      instance_security_group_id = [module.dev_infra.dev_sg_id_output]
    },
    {
      instance_name              = "k3s_master"
      instance_type              = "t2.micro"
      instance_key_name          = module.dev_infra.key_pair_name_output
      instance_allow_public_ip   = false
      instance_subnet_id         = module.dev_infra.private_subnet_id_output
      instance_security_group_id = [module.dev_infra.dev_sg_id_output]
    },
    {
      instance_name              = "worker_1",
      instance_type              = "t2.micro"
      instance_key_name          = module.dev_infra.key_pair_name_output
      instance_allow_public_ip   = false
      instance_subnet_id         = module.dev_infra.private_subnet_id_output
      instance_security_group_id = [module.dev_infra.dev_sg_id_output]
    },
    {
      instance_name              = "worker_2",
      instance_type              = "t2.micro"
      instance_key_name          = module.dev_infra.key_pair_name_output
      instance_allow_public_ip   = false
      instance_subnet_id         = module.dev_infra.private_subnet_id_output
      instance_security_group_id = [module.dev_infra.dev_sg_id_output]
    }

  ]





}


