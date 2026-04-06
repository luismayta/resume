## 1. Create Profile Data Files

- [x] 1.1 Create `src/data/profiles/ai-platform-engineer.yml` with profile metadata (name, title, summary, contact)
- [x] 1.2 Create `src/data/experience/ai-platform-engineer.yml` with work history entries
- [x] 1.3 Add translations in `src/data/translations/en.yml` for profile content
- [x] 1.4 Add translations in `src/data/translations/es.yml` for profile content

## 2. Create Sidebar Content

- [x] 2.1 Create `src/sidebars/ai-platform-engineer/skills.tex` with technical skills (ML/AI Infra, Platform, Cloud)
- [x] 2.2 Create `src/sidebars/ai-platform-engineer/soft_skills.tex` with interpersonal skills
- [x] 2.3 Create `src/sidebars/ai-platform-engineer/certifications.tex` with relevant certifications
- [x] 2.4 Create `src/sidebars/ai-platform-engineer/education.tex` with education background
- [x] 2.5 Create `src/sidebars/ai-platform-engineer/languages.tex` with language proficiency

## 3. Update Build System

- [x] 3.1 Add build targets to `Taskfile.yml` for ai-platform-engineer profile (en/es)
- [x] 3.2 Update `provision/scripts/generate_resume.py` to handle new profile
- [x] 3.3 Add profile to `resume:all` target for automatic generation

## 4. Generate and Validate

- [x] 4.1 Run `task resume:profile PROFILE=ai-platform-engineer LANG=en` to generate English PDF
- [x] 4.2 Run `task resume:profile PROFILE=ai-platform-engineer LANG=es` to generate Spanish PDF
- [x] 4.3 Validate PDF output against existing profiles for consistency
- [x] 4.4 Verify all sections render correctly (header, experience, skills, education)

## 5. Finalize

- [ ] 5.1 Commit changes with proper commit message (conventional commits)
- [ ] 5.2 Verify CI/CD pipeline passes for resume generation