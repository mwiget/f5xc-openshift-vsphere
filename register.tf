module "register_clusters" {

  source = "./modules/registration"
  for_each = toset( ["osc2", "osc3"] )

  cluster_name = "${var.projectPrefix}-${each.key}"
}
