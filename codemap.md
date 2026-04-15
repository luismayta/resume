# Repository Atlas: resume

## Project Responsibility

A professional resume/CV built with **LaTeX** (AltaCV class), featuring a multi-page layout with sidebar content, automated build via Docker+XeLaTeX, and CI/CD automation for releases and documentation.

## System Entry Points

- `src/resumes/` - Generated LaTeX files per profile/language
- `Taskfile.yml` - Task automation for build, lint, release, and documentation generation
- `biome.json` - Code formatter/linter configuration
- `.pre-commit-config.yaml` - Pre-commit hooks with commitlint validation
- `commitlint.config.js` - Commit message validation rules

## Directory Map (Aggregated)

| Directory | Responsibility Summary | Detailed Map |
| --- | --- | --- |
| `src/core/` | LaTeX document classes and custom packages | [View Map](src/core/codemap.md) |
| `src/config/` | LaTeX configuration (colors, margins, commands) | [View Map](src/config/codemap.md) |
| `src/sections/` | Resume content sections (experience, education) | [View Map](src/sections/codemap.md) |
| `src/sidebars/` | Sidebar content per page (skills, certs) | [View Map](src/sidebars/codemap.md) |
| `src/data/` | YAML data files for profiles and translations | [View Map](src/data/codemap.md) |
| `src/resumes/` | Generated .tex files per profile (ai-architect, cloud-architect, golang-developer) | - |
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