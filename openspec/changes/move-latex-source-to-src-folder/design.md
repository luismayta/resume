## Context

Current structure has LaTeX sources mixed with project configuration:
- `core/`, `config/`, `sections/`, `sidebars/`, `styles/`, `data/` in root
- `resume.tex`, `page*.tex` in root
- Build artifacts in `build/` (already configured)

## Goals / Non-Goals

**Goals:**
- Move all LaTeX source to `src/` folder
- Maintain build functionality
- Update all references and paths

**Non-Goals:**
- Modify LaTeX content or styling
- Change the resume generation logic

## Decisions

1. **Use `src/` as the main source directory**
   - Rationale: Standard convention for source code

2. **Structure: `src/core/`, `src/config/`, etc.**
   - Keep existing subdirectory structure intact

3. **Root LaTeX files to `src/resumes/`**
   - `resume.tex` → `src/resumes/resume.tex`
   - `page1sidebar.tex` → `src/resumes/page1sidebar.tex`
   - etc.

4. **Generated files to `src/resumes/` (not build/)**
   - Rationale: Generated .tex files are source, not build artifacts

5. **Update relative paths in .tex files**
   - `\input{./core/...}` → `\input{../core/...}`
   - For generated files in `src/resumes/`, paths go up one level

## Risks / Trade-offs

- **Risk**: Many files to update (paths, Taskfile, script)
  - **Mitigation**: Systematic approach with clear checklist

- **Risk**: Breaking build if paths not updated correctly
  - **Mitigation**: Test after each phase