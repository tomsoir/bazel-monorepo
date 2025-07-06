# Install on K8s
```bash
# Exec helm-control-panel
$ make helm_docker_exec_container

# (ONLY ONCE, use update after) First time release installation
$ helm install example-project-release ./example-project-chart

# Upgrade k8s manifests only (inside helm-control-panel)
$ helm upgrade example-project-release ./example-project-chart

# Upgrade with new image (inside helm-control-panel)
$ helm upgrade example-project-release ./example-project-chart --set image.tag=0.0.93

# Delete (note after delete you need to run helm install first, than helm update for further releases)
$ helm delete example-project-release
```

# Debug
```bash
# List all releases in all namespaces
$ helm list -A

# Find resources
$ kubectl get all -n default -l app=example-project
$ kubectl get svc -n default
$ kubectl get ingress -n default

# Read logs
$ kubectl logs -n default <ingress-nginx-controller-POD-NAME>
```
