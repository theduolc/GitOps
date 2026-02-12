# Demo CI/CD Project

## Projektübersicht
Dieses Projekt zeigt eine komplette CI/CD Pipeline für ein Demo-Helm-Chart und Docker Image.  

Es soll eine kleine Python-Webapp (Flask) gebaut werden, verpackt in ein Docker-Image. Für dieses Projekt wird Helm-Chart verwendet und ein lokaler kind-Kubernetes-Cluster betrieben. Mit ArgoCD in dem Cluster wird die App per GitOps auf einem lokalen Gitea Git-Server verwaltet. Mit act wird eine lokale CI-Pipeline (GitHub Actions lokal) erzeugt die das Image baut, mit Trivy scannt und mit conftest eine Policy prüft.

Funktionen:
- Docker Image bauen
- Trivy Sicherheits-Scan
- Helm Templates rendern
- Conftest Policies prüfen

## Struktur
```
demo-project/
├─ .github/
│  └─ workflows/
│     └─ ci.yml
├─ demo-helm/
│  ├─ Chart.yaml
│  ├─ values.yaml
│  └─ templates/
│     ├─ deployment.yaml
│     ├─ service.yaml
│     └─ ingress.yaml
├─ policy/
│  └─ security.rego
├─ Dockerfile
└─ README.md
```

## Installiere diese Tools

1. Docker (Engine + docker-compose)
2. kubectl
3. kind (lokaler Kubernetes-Cluster)
4. helm
5. argocd CLI (optional, aber praktisch)
6. act (zum lokalen Ausführen von GitHub Actions)
7. trivy
8. conftest
9. Gitea

## Lokale Tests mit `act`

```bash
act -j build --container-architecture linux/amd64 --privileged
```

## GitHub Actions
1. Push in ein Git-Repo
2. Workflow wird automatisch ausgeführt

## Hinweise
- `Trivy` wird per Container ausgeführt
- `Conftest` prüft Policies im `policy/` Ordner
- Helm Charts liegen in `demo-helm/`
