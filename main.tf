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
    public_route_table_name = "public_route_table_1"
    public_vpc_id           = module.dev_infra.vpc_id_output
    public_routes = [
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
    private_subnet_availability_zone = "us-east-1a"
    vpc_id                           = module.dev_infra.vpc_id_output
    vpc_name                         = module.dev_infra.vpc_name_output
    }
  ]


  // Route table for private subnets
  aws_route_table_for_private_subnets = [{
    private_route_table_name = "private_route_table_1"
    private_vpc_id           = module.dev_infra.vpc_id_output
    private_routes = [
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

  frontend_sg_details = [{
    name           = "frontend_sg"
    vpc_attachment = module.dev_infra.vpc_id_output
    frontend_ingress = [
      {
        from_port   = 6443
        to_port     = 6443
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
        description = "Allow traffic from VPC"
    }]
    frontend_egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all traffic"
    }]
  }]
}

