# Repository Atlas: resume

## Project Responsibility

A professional resume/CV built with **LaTeX** (AltaCV class), featuring a multi-page layout with sidebar content, automated build via Docker+XeLaTeX, and CI/CD automation for releases and documentation.

## System Entry Points

- `resume.tex` - Main LaTeX document entry point
- `Taskfile.yml` - Task automation for build, lint, release, and documentation generation
- `biome.json` - Code formatter/linter configuration
- `.pre-commit-config.yaml` - Pre-commit hooks

## Directory Map (Aggregated)

| Directory | Responsibility Summary | Detailed Map |
| --- | --- | --- |
| `core/` | LaTeX document classes and custom packages | [View Map](core/codemap.md) |
| `config/` | LaTeX configuration (colors, margins, commands) | [View Map](config/codemap.md) |
| `sections/` | Resume content sections (experience, education) | [View Map](sections/codemap.md) |
| `sidebars/` | Sidebar content per page (skills, certs) | [View Map](sidebars/codemap.md) |
| `data/` | BibTeX bibliography files | [View Map](data/codemap.md) |
| `provision/` | Automation: XeLaTeX builds, diagrams, docs | [View Map](provision/codemap.md) |
| `provision/task/` | Task automation for XeLaTeX in Docker | [View Map](provision/task/codemap.md) |
| `openspec/` | OpenSpec workflow configuration | [View Map](openspec/codemap.md) |

## Build System

### Task Automation (Taskfile.yml)

The project uses [go-task](https://taskfile.dev/) for task automation:

- `task resume` - Compiles resume.tex to PDF via Docker+XeLaTeX
- `task validate` - Runs pre-commit hooks
- `task readme` - Generates README from template
- `task upgrade` - Updates dependencies

### CI/CD Workflows (`.github/workflows/`)

- `resume.yml` - Compiles and publishes resume PDF
- `lint.yml` - Code quality checks
- `release.yml` - Semantic version releases
- `confluence.yml` - Publishes docs to Confluence
- `sonarqube.yml` - Static analysis
- `github_actions_security.yml` - Security scanning

## Technology Stack

- **Typesetting**: LaTeX with AltaCV class
- **Build**: Docker + XeLaTeX
- **Task Automation**: go-task (Taskfile.yml)
- **CI/CD**: GitHub Actions
- **Linting**: Biome, pre-commit, yamllint, hadolint, checkov
- **Documentation**: MkDocs