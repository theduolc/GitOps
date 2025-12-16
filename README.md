# Demo CI/CD Project

## Projektübersicht
Dieses Projekt zeigt eine komplette CI/CD Pipeline für ein Demo-Helm-Chart und Docker Image.  

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

## Installiere diese Tools (kurze Übersicht — Befehle folgen):

Docker (Engine + docker-compose)
kubectl
kind
helm
argocd CLI (optional, aber praktisch)
act (zum lokalen Ausführen von GitHub Actions)
trivy
conftest
git

## Lokale Tests mit `act`
1. Installiere [act](https://github.com/nektos/act) und Docker.
2. Im Projektverzeichnis:
```bash
act -j build --container-architecture linux/amd64 --privileged
```

## GitHub Actions
1. Push in dein GitHub-Repo.
2. Workflow wird automatisch ausgeführt.

## Hinweise
- `Trivy` wird per Container ausgeführt.
- `Conftest` prüft Policies im `policy/` Ordner.
- Helm Charts liegen in `demo-helm/`.
