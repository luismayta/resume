# provision/task/

## Responsibility

This directory contains task automation definitions using [go-task](https://taskfile.dev/) (the task runner). It provides build and validation tasks for generating the resume using XeLaTeX in a Docker container.

## Files

### xelatex.yml
Task definition file that defines the build pipeline for generating the resume. Contains four main tasks:

- **`check`**: Verifies that xelatex and its dependencies exist. Runs once and depends on `check:docker`.
- **`check:docker`**: Checks if Docker is installed on the system. Uses shell precondition to validate `docker` command availability.
- **`make`**: Executes the `resume` task to generate the resume.
- **`resume`**: Main task that generates the resume using XeLaTeX. Runs a Docker container (`hadenlabs/xelatex:4.1`) that mounts the current directory and compiles `resume.tex` to PDF output.

### codemap.md
This documentation file providing architectural understanding of the task directory.

## Design

The task file follows a dependency-based execution model:
- Task dependencies are declared using the `deps` field
- The `run: once` directive ensures tasks execute only once per invocation
- Docker is used as the build environment to ensure consistent XeLaTeX compilation across different systems

## Flow

1. User invokes `task make` or `task resume`
2. `resume` task depends on `check` task
3. `check` task depends on `check:docker` task
4. `check:docker` validates Docker is installed
5. If validation passes, Docker runs XeLaTeX to compile `resume.tex` to PDF

## Integration

- **Input**: Reads `resume.tex` from the project root
- **Output**: Generates PDF files in the `./` output directory
- **External Dependencies**: 
  - Docker daemon must be running
  - `hadenlabs/xelatex:4.1` Docker image