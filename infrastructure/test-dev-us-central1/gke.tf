locals {
  k8s_version = "1.18.15-gke.800"
}

data "google_client_config" "default" {}

provider "kubernetes" {
  load_config_file       = false
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "13.0.0"

  project_id         = module.project_factory.project_id
  name               = "test-gke"
  region             = "us-central1"
  zones              = ["us-central1-a", "us-central1-b"]
  network            = "vpc-02"
  subnetwork         = "vpc-02-us-central1-01"
  network_project_id = local.network_project
  kubernetes_version = local.k8s_version

  ip_range_pods     = "vpc-02-us-central1-01-pods"
  ip_range_services = "vpc-02-us-central1-01-services"

  remove_default_node_pool        = true
  skip_provisioners               = true
  enable_vertical_pod_autoscaling = true
  add_cluster_firewall_rules      = true

  node_pools = [
    {
      name           = "default-node-pool"
      node_locations = "us-central1-a"
      machine_type   = "e2-standard-4"
      min_count      = 1
      max_count      = 25
      disk_type      = "pd-ssd"
      auto_upgrade   = false
      version        = local.k8s_version
    },
  ]
}
