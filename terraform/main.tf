module "kind-cluster" {
  source = "./module/kind_cluster"
}
module "metallb" {
depends_on = [module.kind-cluster]
  source = "./module/helm_addons/metallb"
}

module "argocd" {
depends_on = [module.metallb]
  source = "./module/helm_addons/argocd"
}

module "chatapp" {
depends_on = [module.argocd, module.kind-cluster]
  source = "./module/chatapp"
}