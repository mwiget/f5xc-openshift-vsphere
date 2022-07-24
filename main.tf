terraform {
  required_providers {
    volterra = {
      source = "volterraedge/volterra"
      version = "0.11.9"
    }
  }

  required_version = ">= 0.13"
}


module "register_clusters" {

  source = "./modules/registration"
  for_each = toset( ["osc2", "osc3"] )

  cluster_name = "${var.projectPrefix}-${each.key}"
}
