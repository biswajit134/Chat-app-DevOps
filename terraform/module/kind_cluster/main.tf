resource "kind_cluster" "kind-cluster" {
  name = "test"
  config = <<-EOF
        apiVersion: kind.x-k8s.io/v1alpha4
        kind: Cluster
        nodes:
        - role: control-plane
          image: kindest/node:v1.35.1
          extraPortMappings:
          - containerPort: 30080
            hostPort: 8080
          - containerPort: 30501
            hostPort: 5001
          - containerPort: 27017
            hostPort: 27017
        - role: worker
          image: kindest/node:v1.35.1
        - role: worker
          image: kindest/node:v1.35.1
    EOF
}