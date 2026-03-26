## Context

Currently, when XeLaTeX compiles the resume, it generates multiple artifacts in the project root:
- `.aux` - Auxiliary files
- `.bcf` - Build correlation file
- `.log` - Build log
- `.out` - Output file
- `.pdf` - Final PDF
- `.run.xml` - Run metadata
- `.tex` - Generated TeX files (for some profiles)

This pollutes the root directory and makes it harder to distinguish source files from generated files.

## Goals / Non-Goals

**Goals:**
- Move all LaTeX build artifacts to a `build/` directory
- Maintain the same build process via Taskfile
- Keep `.gitignore` updated to ignore build artifacts

**Non-Goals:**
- Change the PDF generation process itself
- Modify the LaTeX content or styling

## Decisions

1. **Use `build/` directory instead of `dist/`**
   - Rationale: `build/` is the conventional directory for compiled/intermediate artifacts (vs `dist/` for distribution-ready files)

2. **Use XeLaTeX `-output-directory` option**
   - Alternative considered: Use `-jobname` with subdirectory
   - XeLaTeX's `-output-directory=<dir>` is the standard way to redirect all output files

3. **Update Taskfile.yml to use `-output-directory=build`**
   - The existing `xelatex` task will be modified to add this flag

4. **Update `.gitignore` to ignore `build/` contents**
   - Use `build/` pattern to ignore everything inside the directory

## Risks / Trade-offs

- **Risk**: Generated PDFs won't be at root (e.g., `resume.pdf`)
  - **Mitigation**: Users will need to reference `build/resume.pdf` or update their scripts. Document this change clearly.

- **Risk**: Some tools may expect PDF at root
  - **Mitigation**: The Taskfile will provide a copy task to move PDF to root if needed