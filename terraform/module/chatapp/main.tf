resource "kubernetes_namespace_v1" "chat-app" {
  metadata {
    name = "chat-app"
  }
  
}

resource "kubectl_manifest" "chatapp" {
  depends_on = [ kubernetes_namespace_v1.chat-app ]
  wait = true
    yaml_body = templatefile("${path.module}/chatapp.yaml", {})
}

# resource "kubectl_manifest" "chatapp_database" {
#   depends_on = [ kubernetes_namespace_v1.chat-app ]
#   wait = true
#     yaml_body = templatefile("${path.module}/chatapp-database.yaml", {})
# }

# resource "kubectl_manifest" "chatapp_backend" {
#   depends_on = [ kubectl_manifest.chatapp_database ]
#   wait = true
#     yaml_body = templatefile("${path.module}/chatapp-backend.yaml", {})
# }

# resource "kubectl_manifest" "chatapp_frontend" {
#   depends_on = [ kubectl_manifest.chatapp_backend ]
#   wait = true
#     yaml_body = templatefile("${path.module}/chatapp-frontend.yaml", {})
# }

