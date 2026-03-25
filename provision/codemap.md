# provision/

## Responsibility

This directory contains provision and automation configuration files for the resume project. It defines task automation, diagram generation, template rendering, and README generation workflows. The provision system enables building, generating, and publishing the LaTeX-based resume with its associated documentation and diagrams.

## Files

### Task Automation Files

#### provision/task/xelatex.yml
Task definition file using [go-task](https://taskfile.dev/) that defines the build pipeline for generating the resume with XeLaTeX. Contains four main tasks:

- **`check`**: Verifies that xelatex and its dependencies exist. Runs once and depends on `check:docker`.
- **`check:docker`**: Checks if Docker is installed on the system. Uses shell precondition to validate `docker` command availability.
- **`make`**: Executes the `resume` task to generate the resume.
- **`resume`**: Main task that generates the resume using XeLaTeX. Runs a Docker container (`hadenlabs/xelatex:4.1`) that mounts the current directory and compiles `resume.tex` to PDF output.

#### provision/task/codemap.md
Documentation file providing architectural understanding of the task directory.

### Diagram Generation Files

#### provision/diagrams/Taskfile.yml
Task definition file for building and publishing PlantUML diagrams. Contains three main tasks:

- **`build`**: Builds PlantUML diagrams. Creates output directories (`decks/images/diagrams`, `static/images/diagrams`, `docs/images/diagrams`) and runs the `make` task.
- **`publish`**: Publishes generated diagrams. Syncs PNG files from `provision/diagrams/` to the project root, removing source files after copying.
- **`make`**: Generates PNG files from PlantUML source files. Uses Docker container (`infosisarg/plantuml`) to render all `.plantuml` files found in the project.

#### provision/diagrams/docs/diagrams/example.plantuml
Empty PlantUML diagram template file (placeholder for future diagram examples).

#### provision/diagrams/docs/diagrams/logo.plantuml
Empty PlantUML diagram file for logo generation (placeholder for future logo diagrams).

#### provision/diagrams/codemap.md
Documentation file for the diagrams subdirectory (template).

### Template Files

#### provision/templates/README.tpl.md
Go template file for generating the project README.md. Uses gomplate syntax to render dynamic content from configuration. Includes templates for:

- Badges display
- Project name and logo
- Description
- Screenshots
- Features list
- Modules list
- Introduction
- TODO items
- Requirements
- Installation instructions
- Usage documentation
- Quick start guide
- Examples
- Related projects
- References
- Contributing guidelines
- Module versioning information
- Copyrights
- Contributors section
- License information

The template pulls configuration from `provision/generators/README.yaml` and is processed by the `task readme` command.

### Configuration Files

#### provision/generators/README.yaml
Canonical configuration file for README.md generation. Contains:

- **Project metadata**: name (`resume`), support email, license (`LGPL-3.0`), GitHub repo
- **Badges**: Multiple badges for releases, lint, CI, test, pre-commit, conventional commits, and changelog
- **Description**: LaTeX resume template description with XeLaTeX compilation info
- **Features**: Three main features (customizable, unicode support, FontAwesome 5)
- **References**: Attribution to billryan/resume as inspiration
- **Requirements**: Pyenv and Docker prerequisites

### Documentation Files

#### provision/diagrams/codemap.md
Template documentation file for the diagrams subdirectory.

#### provision/task/codemap.md
Detailed documentation of the task automation system (see Files section above).

## Design

### Architecture Overview

The provision system is organized into three main functional areas:

1. **Task Automation** (`task/`): Build and compilation tasks using go-task
2. **Diagram Generation** (`diagrams/`): PlantUML rendering and publishing
3. **Documentation Generation** (`generators/`, `templates/`): README and documentation rendering

### Key Patterns

- **Docker-based builds**: All resource-intensive operations (XeLaTeX, PlantUML) run in Docker containers to ensure consistent builds across platforms
- **Task dependencies**: Task files use dependency chains (`deps`) to ensure prerequisites are met before execution
- **Template-driven generation**: README and documentation use Go templates with YAML configuration for dynamic content
- **Output directory structure**: Diagrams are rendered to multiple output directories (`decks/`, `static/`, `docs/`)

## Flow

### Resume Generation Flow
```
task make/resume
    -> check task (validates dependencies)
        -> check:docker (validates Docker installation)
    -> Docker runs hadenlabs/xelatex:4.1
    -> Compiles resume.tex to PDF
    -> Outputs PDF to ./ directory
```

### Diagram Generation Flow
```
task diagrams:build
    -> Creates output directories
    -> make task runs Docker container with PlantUML
    -> Finds all .plantuml files (excluding .terraform)
    -> Renders to PNG files
    -> publish task syncs PNGs to root directories
```

### README Generation Flow
```
task readme
    -> Reads provision/generators/README.yaml
    -> Processes provision/templates/README.tpl.md
    -> Renders dynamic content with gomplate
    -> Writes README.md to project root
```

## Integration

### Input Dependencies
- **resume.tex**: Main LaTeX source file for resume compilation
- **provision/generators/README.yaml**: Configuration for README generation
- **provision/templates/README.tpl.md**: Template for README rendering
- **.plantuml files**: PlantUML source files for diagram generation (located in `provision/diagrams/docs/diagrams/`)

### Output Artifacts
- **PDF files**: Compiled resume PDF from XeLaTeX
- **PNG files**: Rendered diagrams from PlantUML
- **README.md**: Generated project documentation

### External Systems
- **Docker**: Required for all build operations
- **hadenlabs/xelatex:4.1**: Docker image for LaTeX compilation
- **infosisarg/plantuml**: Docker image for PlantUML rendering
- **GitHub**: Referenced for badges and issue tracking