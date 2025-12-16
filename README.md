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

## Installiere diese Tools

1. Docker (Engine + docker-compose)
2. kubectl
3. kind
4. helm
5. argocd CLI (optional, aber praktisch)
6. act (zum lokalen Ausführen von GitHub Actions)
7. trivy
8. conftest
9. git

## Lokale Tests mit `act`

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
