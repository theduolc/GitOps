package main

deny[msg] {
  input.Kind == "Deployment"
  not input.spec.template.spec.containers[0].securityContext
  msg = "Missing container securityContext"
}
