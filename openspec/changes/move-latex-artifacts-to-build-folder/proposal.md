## Why

Currently, LaTeX build artifacts (.aux, .bcf, .pdf, .run.xml, .log, etc.) are generated in the root directory, polluting the project structure. Following standard build practices, these generated files should be placed in a dedicated `build/` or `dist/` folder to keep the root clean and improve project organization.

## What Changes

- Create a `build/` directory for LaTeX output artifacts
- Configure XeLaTeX to output all generated files to `build/` instead of root
- Update `.gitignore` to ignore `build/` contents
- Update Taskfile.yml to reference new artifact locations if needed

## Capabilities

### New Capabilities

- **latex-build-folder**: Configure LaTeX build system to output all artifacts to a dedicated `build/` directory instead of the project root

### Modified Capabilities

- None

## Impact

- Taskfile.yml (XeLaTeX task configuration)
- .gitignore (add build/ directory)
- All LaTeX compilation outputs (.aux, .bcf, .pdf, .run.xml, .log, .out, .tex)