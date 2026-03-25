# AGENTS.md

> A README for AI coding agents. This file provides context and instructions to help agents work effectively on this project.

## Project Overview

This is a professional resume/CV built with **LaTeX** (AltaCV class) featuring:
- Multi-page layout with sidebar content
- Automated build via Docker + XeLaTeX
- CI/CD automation with GitHub Actions
- Task automation with go-task

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
./core/codemap.md            # LaTeX classes & packages
./config/codemap.md          # Colors, margins, commands
./sections/codemap.md        # Resume content sections
./sidebars/codemap.md        # Sidebar content
./data/codemap.md            # BibTeX bibliographies
./provision/codemap.md       # Automation & CI/CD
./provision/task/codemap.md  # XeLaTeX Docker builds
./openspec/codemap.md        # OpenSpec config
```

### Directory Structure

```
.
├── resume.tex               # Main LaTeX entry point
├── Taskfile.yml             # Task automation (go-task)
├── core/                    # LaTeX document classes & packages
│   ├── *.cls               # Document classes (altacv, core)
│   ├── packages/           # Custom LaTeX packages
│   └── settings/           # Font & section settings
├── config/                  # LaTeX configuration
│   ├── config.tex          # Package imports
│   ├── color.tex           # Color palette
│   ├── margin.tex          # Page geometry
│   ├── commands.tex        # Custom commands
│   └── main.tex            # Config aggregator
├── sections/                # Resume content sections
│   ├── personal.tex        # Header with contact info
│   ├── experience.tex      # Work history
│   ├── day_of_my_life.tex  # Visual wheel chart
│   ├── part_time_roles.tex # Part-time work
│   └── volunteer.tex       # Community involvement
├── sidebars/                # Sidebar content per page
│   ├── skills.tex          # Technical skills
│   ├── soft_skills.tex     # Personal skills
│   ├── certifications.tex  # Certifications
│   ├── education.tex       # Education
│   ├── languages.tex       # Languages
│   ├── honors.tex          # Awards
│   ├── conferences.tex     # Conferences
│   └── referess.tex        # References
├── data/                    # BibTeX files
│   ├── skills.bib          # Skills database
│   └── publications.bib    # Publications
├── provision/                # Automation
│   ├── task/               # go-task definitions
│   └── diagrams/           # PlantUML diagrams
├── .github/workflows/       # CI/CD pipelines
└── openspec/               # OpenSpec configuration
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
# Generate resume PDF (main command)
task resume

# Run in Docker container
task xelatex:resume

# Alternative: direct XeLaTeX (requires XeLaTeX installed)
xelatex -halt-on-error -interaction=nonstopmode resume.tex
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
| `task resume` | Compile resume.tex to PDF |
| `task validate` | Run all pre-commit hooks |
| `task fix` | Auto-fix linting issues |
| `task readme` | Generate README from template |
| `task upgrade` | Update dependencies |
| `task check` | Check all tool dependencies |
| `task -l` | List all available tasks |

## Code Style

### LaTeX Conventions
- Use semantic color names defined in `config/color.tex`
- Follow modular pattern: one file per section
- Use custom commands from `core/packages/` (e.g., `\cvskill`, `\cvevent`, `\cvsection`)
- Keep content in `sections/` and `sidebars/` directories

### Git Conventions
- Follow Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `style:`, `test:`
- Include issue key in commit messages (e.g., `feat: IN-123 add new skill`)
- Use GitHub Flow: feature branches from `main`

### YAML Conventions
- Follow `.github/workflows/` patterns
- Use `biome.json` for code formatting
- Validate with `yamllint`

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
- **Biome**: Code formatter/linter
- **pre-commit**: Git hooks
- **uv**: Python package manager
- **pnpm**: Node package manager
- **bun**: JavaScript runtime

## Troubleshooting

### PDF not compiling
```bash
# Use Docker-based build
task xelatex:resume

# Check XeLaTeX is installed
xelatex --version
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