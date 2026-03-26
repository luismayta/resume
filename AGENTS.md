# AGENTS.md

> A README for AI coding agents. This file provides context and instructions to help agents work effectively on this project.

## Project Overview

This is a professional resume/CV built with **LaTeX** (AltaCV class) featuring:
- Multi-page layout with sidebar content
- Multi-profile support (AI Architect, Cloud Architect, Golang Developer)
- Multi-language support (English, Spanish)
- Automated build via Docker + XeLaTeX
- CI/CD automation with GitHub Actions
- Task automation with go-task
- YAML-based content management with Python converter

## Architecture & Code Navigation

### Using Codemaps (IMPORTANT)

**Before implementing any change, you MUST read the relevant codemap.md files to understand the codebase architecture.**

This project uses Cartography to generate architectural maps. Codemaps provide:
- Directory responsibility
- Design patterns used
- Data/control flow
- Integration points

**How to use:**
1. Start with the root codemap: `./codemap.md`
2. Navigate to subdirectory codemaps using the links in the Directory Map table
3. Each subdirectory has its own `codemap.md` with detailed information

**Codemap locations:**
```
./codemap.md                  # Root - Repository Atlas
./src/core/codemap.md         # LaTeX classes & packages
./src/config/codemap.md       # Colors, margins, commands
./src/sections/codemap.md     # Resume content sections
./src/sidebars/codemap.md     # Sidebar content
./src/data/codemap.md         # YAML data files
./provision/codemap.md        # Automation & CI/CD
./provision/task/codemap.md   # XeLaTeX Docker builds
./openspec/codemap.md         # OpenSpec config
```

### Directory Structure

```
.
├── Taskfile.yml              # Task automation (go-task)
├── src/                      # LaTeX source files (moved from root)
│   ├── resumes/              # Generated .tex files per profile
│   │   ├── resume-ai-architect-en.tex
│   │   ├── resume-ai-architect-es.tex
│   │   ├── resume-cloud-architect-en.tex
│   │   ├── resume-cloud-architect-es.tex
│   │   ├── resume-golang-developer-en.tex
│   │   └── resume-golang-developer-es.tex
│   ├── core/                 # LaTeX document classes & packages
│   │   ├── *.cls            # Document classes (altacv, core)
│   │   ├── packages/        # Custom LaTeX packages
│   │   └── settings/        # Font & section settings
│   ├── config/              # LaTeX configuration
│   │   ├── config.tex       # Package imports
│   │   ├── color.tex        # Color palette
│   │   ├── margin.tex       # Page geometry
│   │   ├── commands.tex     # Custom commands
│   │   └── main.tex         # Config aggregator
│   ├── sections/            # Resume content sections
│   │   ├── personal.tex     # Header with contact info
│   │   ├── experience.tex   # Work history
│   │   ├── day_of_my_life.tex # Visual wheel chart
│   │   ├── part_time_roles.tex # Part-time work
│   │   └── volunteer.tex    # Community involvement
│   ├── sidebars/            # Sidebar content per page
│   │   ├── skills.tex       # Technical skills
│   │   ├── soft_skills.tex  # Personal skills
│   │   ├── certifications.tex # Certifications
│   │   ├── education.tex    # Education
│   │   ├── languages.tex    # Languages
│   │   ├── honors.tex       # Awards
│   │   ├── conferences.tex  # Conferences
│   │   └── referess.tex     # References
│   └── data/                # YAML data files
│       ├── profiles/        # Profile metadata (ai-architect, cloud-architect, golang-developer)
│       ├── experience/      # Experience data per profile
│       ├── sidebars/       # Sidebar content per profile
│       └── translations/    # en.yml, es.yml
├── provision/                # Automation
│   ├── task/               # go-task definitions
│   ├── scripts/            # Python scripts
│   │   └── generate_resume.py # YAML to LaTeX converter
│   └── diagrams/          # PlantUML diagrams
├── .github/workflows/       # CI/CD pipelines
└── openspec/               # OpenSpec configuration
```

## Profile System

The project supports multiple resume profiles:
- **ai-architect**: AI Platform Architect
- **cloud-architect**: Cloud Architect
- **golang-developer**: Golang Developer

Each profile can be generated in English (en) or Spanish (es), resulting in 6 possible PDFs.

### Data Structure
```
src/data/
├── profiles/
│   ├── ai-architect.yml
│   ├── cloud-architect.yml
│   └── golang-developer.yml
├── experience/
│   ├── ai-architect.yml
│   ├── cloud-architect.yml
│   └── golang-developer.yml
├── sidebars/
│   ├── ai-architect/
│   │   ├── skills.tex
│   │   └── certifications.tex
│   ├── cloud-architect/
│   └── golang-developer/
└── translations/
    ├── en.yml
    └── es.yml
```

## Setup Commands

```bash
# Install dependencies
task setup

# Setup development environment
task environment

# Install pre-commit hooks
task pre-commit:setup
```

## Build Commands

```bash
# Generate default resume (ai-architect-en)
task resume

# Generate specific profile and language
task resume:profile PROFILE=ai-architect LANG=en
task resume:profile PROFILE=cloud-architect LANG=es
task resume:profile PROFILE=golang-developer LANG=en

# Generate all 6 resume PDFs
task resume:all

# Clean generated files
task resume:clean

# Run in Docker container
task xelatex:resume
```

## Code Quality & Validation

```bash
# Run all validations
task validate

# Run linting
task pre-commit:lint

# Run code formatting
task biome:fix
task uv:fmt
```

## Frequent Commands

| Command | Description |
|---------|-------------|
| `task resume` | Generate default resume PDF |
| `task resume:profile PROFILE=X LANG=Y` | Generate specific profile |
| `task resume:all` | Generate all 6 PDFs |
| `task resume:clean` | Clean generated files |
| `task validate` | Run all pre-commit hooks |
| `task fix` | Auto-fix linting issues |
| `task readme` | Generate README from template |
| `task upgrade` | Update dependencies |
| `task check` | Check all tool dependencies |
| `task -l` | List all available tasks |

## Code Style

### LaTeX Conventions
- Use semantic color names defined in `src/config/color.tex`
- Follow modular pattern: one file per section
- Use custom commands from `src/core/packages/` (e.g., `\cvskill`, `\cvevent`, `\cvsection`)
- Keep content in `src/sections/` and `src/sidebars/` directories

### YAML Conventions
- Profile data in `src/data/profiles/`
- Experience data in `src/data/experience/` with emphasis tags
- Use `emphasis` field to highlight relevant experience per profile

### Git Conventions
- Follow Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `style:`, `test:`
- Include issue key in commit messages (e.g., `feat: IN-123 add new skill`)
- Use GitHub Flow: feature branches from `main`

### Python Conventions
- Use `provision/scripts/generate_resume.py` for YAML to LaTeX conversion
- Follow project Python style (ruff formatting)

## CI/CD Workflows

Located in `.github/workflows/`:
- `resume.yml` - Compiles and publishes PDF
- `lint.yml` - Code quality checks
- `release.yml` - Semantic versioning
- `confluence.yml` - Publish docs
- `sonarqube.yml` - Static analysis
- `github_actions_security.yml` - Security scanning

## Testing

This project uses pre-commit hooks for validation:

```bash
# Run pre-commit manually
pre-commit run --all-files

# Skip specific hooks
SKIP=yamllint,hadolint task validate
```

## Security Considerations

- Do not commit secrets or credentials
- Use environment variables for sensitive data (see `.env.example`)
- CI/CD workflows use GitHub Secrets
- Docker builds run in isolated containers

## Dependencies

- **XeLaTeX**: For PDF compilation (use Docker via `task resume`)
- **go-task**: Task automation (`Taskfile.yml`)
- **Docker**: Container for builds
- **Python**: For YAML to LaTeX conversion (`generate_resume.py`)
- **PyYAML**: Python YAML library
- **Biome**: Code formatter/linter
- **pre-commit**: Git hooks
- **uv**: Python package manager
- **pnpm**: Node package manager
- **bun**: JavaScript runtime

## Troubleshooting

### PDF not compiling
```bash
# Use Docker-based build
task resume:profile PROFILE=ai-architect LANG=en

# Or generate all PDFs
task resume:all
```

### Pre-commit failing
```bash
# Update hook versions
task upgrade

# Run manually to see errors
pre-commit run --all-files
```

### Task not found
```bash
# Install go-task
# macOS: brew install go-task
# Linux: sudo sh -c 'sh -c "$(curl --location https://taskfile.dev/installers/sh/get -s run)"'

# List all tasks
task --list
```

---

For more details, see:
- [README.md](./README.md) - Human-focused documentation
- [codemap.md](./codemap.md) - Architecture reference
- [docs/contributing.md](./docs/contributing.md) - Contribution guidelines