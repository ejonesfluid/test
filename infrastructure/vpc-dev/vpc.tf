module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0.0"

  project_id   = module.project_factory.project_id
  network_name = "vpc-01"

  subnets = [
    {
      subnet_name   = "vpc-01-us-central1-01"
      subnet_ip     = "10.0.4.0/22"
      subnet_region = "us-central1"
    },
    {
      subnet_name   = "vpc-01-us-central1-02"
      subnet_ip     = "172.16.4.0/22"
      subnet_region = "us-central1"
    },
  ]

  secondary_ranges = {
    "vpc-01-us-central1-01" = [
      {
        range_name    = "vpc-01-us-central1-01-pods"
        ip_cidr_range = "10.4.0.0/14"
      },
      {
        range_name    = "vpc-01-us-central1-01-services"
        ip_cidr_range = "10.0.32.0/20"
      },
    ]

    "vpc-01-us-central1-02" = [
      {
        range_name    = "vpc-01-us-central1-02-pods"
        ip_cidr_range = "172.20.0.0/14"
      },
      {
        range_name    = "vpc-01-us-central1-02-services"
        ip_cidr_range = "172.16.16.0/20"
      },
    ]
  }
}

module "vpc2" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0.0"

  project_id   = module.project_factory.project_id
  network_name = "vpc-02"

  subnets = [
    {
      subnet_name   = "vpc-02-us-central1-01"
      subnet_ip     = "10.0.4.0/22"
      subnet_region = "us-central1"
    },
    {
      subnet_name   = "vpc-02-us-central1-02"
      subnet_ip     = "172.16.4.0/22"
      subnet_region = "us-central1"
    },
  ]

  secondary_ranges = {
    "vpc-02-us-central1-01" = [
      {
        range_name    = "vpc-02-us-central1-01-pods"
        ip_cidr_range = "10.4.0.0/14"
      },
      {
        range_name    = "vpc-02-us-central1-01-services"
        ip_cidr_range = "10.0.32.0/20"
      },
    ]

    "vpc-02-us-central1-02" = [
      {
        range_name    = "vpc-02-us-central1-02-pods"
        ip_cidr_range = "172.20.0.0/14"
      },
      {
        range_name    = "vpc-02-us-central1-02-services"
        ip_cidr_range = "172.16.16.0/20"
      },
    ]
  }
}
