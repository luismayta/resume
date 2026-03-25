## 1. Data Structure Setup

- [x] 1.1 Create `data/profiles/` directory with YAML files for ai-architect, cloud-architect, golang-developer
- [x] 1.2 Create `data/experience/` directory with YAML files for each profile
- [x] 1.3 Create `data/sidebars/` directory structure with skills, certifications per profile
- [x] 1.4 Create `data/translations/` with en.yml and es.yml translation files
- [x] 1.5 Add PyYAML dependency to project

## 2. Python Converter Script

- [x] 2.1 Create `scripts/generate_resume.py` with CLI (--profile, --lang, --all options)
- [x] 2.2 Implement YAML loader for profile metadata
- [x] 2.3 Implement experience converter with emphasis filtering
- [x] 2.4 Implement sidebar content loader
- [x] 2.5 Implement translation loader with fallback
- [x] 2.6 Implement .tex file generator

## 3. Taskfile Integration

- [x] 3.1 Add `resume:profile` task with PROFILE and LANG variables
- [x] 3.2 Add `resume:all` task to generate all 6 PDFs
- [x] 3.3 Add `resume:clean` task to remove generated files

## 4. Content Migration

- [x] 4.1 Migrate current personal.tex to data/profiles/ai-architect.yml
- [x] 4.2 Migrate experience to data/experience/ with emphasis tags
- [x] 4.3 Migrate skills to data/sidebars/ per profile
- [x] 4.4 Migrate certifications to data/sidebars/ per profile
- [x] 4.5 Create remaining profile data (cloud-architect, golang-developer)

## 5. Generation and Build

- [x] 5.1 Run generator for all 6 profile-language combinations
- [x] 5.2 Run xelatex to generate 6 PDF files
- [x] 5.3 Verify all PDFs compile without errors
- [ ] 5.4 Commit all generated .tex and .pdf files

## 6. Cleanup

- [ ] 6.1 Deprecate or remove old resume.tex structure
- [ ] 6.2 Update documentation (README.md, AGENTS.md)
- [ ] 6.3 Verify task resume still works or update to new task names