## Why

Currently, LaTeX source files are scattered in the project root alongside configuration and build files. Moving them to a dedicated `src/` folder follows standard software project conventions and improves project organization.

## What Changes

- Move `core/`, `config/`, `sections/`, `sidebars/`, `styles/`, `data/` to `src/`
- Move root LaTeX files (`resume.tex`, `page*.tex`) to `src/resumes/`
- Update Python generator script to output .tex files to `src/resumes/`
- Update Taskfile.yml to reference new locations
- Configure build output to `build/` directory (already implemented)

## Capabilities

### New Capabilities

- **latex-source-reorganization**: Reorganize LaTeX source files into standard src/ directory structure

### Modified Capabilities

- None

## Impact

- Taskfile.yml (paths to LaTeX files)
- Python generator script (output directory)
- All LaTeX file references to relative paths (e.g., `\input{../core/packages}`)