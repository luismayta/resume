## 1. Create src/ directory structure

- [x] 1.1 Create `src/core/`, `src/config/`, `src/sections/`, `src/sidebars/`, `src/styles/`, `src/data/`, `src/resumes/` directories
- [x] 1.2 Copy all files from root folders to src/ (core → src/core, config → src/config, etc.)
- [x] 1.3 Copy root LaTeX files to src/resumes/ (resume.tex, page1sidebar.tex, page2sidebar.tex)

## 2. Update relative paths in source files

- [x] 2.1 Update `\input{./core/...}` → `\input{../core/...}` in all .tex files under src/
- [x] 2.2 Update `\input{./config/...}` → `\input{../config/...}` in all .tex files
- [x] 2.3 Update `\input{./sections/...}` → `\input{../sections/...}` in all .tex files
- [x] 2.4 Update paths in sidebar files (./sidebars/ → ../sidebars/)
- [x] 2.5 Update paths in style files

## 3. Update Python generator script

- [x] 3.1 Update default output directory to `src/resumes/`
- [x] 3.2 Update all path references in generated .tex files (input paths should point to ../core, ../config, etc.)

## 4. Update Taskfile.yml

- [x] 4.1 Update xelatex task to point to src/resumes/ for .tex files
- [x] 4.2 Ensure -output-directory=build remains for PDF output

## 5. Test build

- [x] 5.1 Run `task resume:profile PROFILE=ai-architect LANG=en`
- [x] 5.2 Verify PDF generated at `build/resume-ai-architect-en.pdf`
- [x] 5.3 Verify PDF content is correct

## 6. Clean up

- [x] 6.1 Remove old directories from root (core/, config/, sections/, etc.)
- [x] 6.2 Remove old root .tex files (resume.tex, page*.tex)
- [x] 6.3 Verify git status shows clean reorganization