## Context

The resume project currently has a single hardcoded profile (AI Platform Architect) in English. The build uses `task resume` which runs XeLaTeX via Docker. The structure is:

```
resume.tex → includes sections/personal.tex, sections/experience.tex, sidebars/*.tex
```

We need to support:
- 3 profiles: AI Architect, Cloud Architect, Golang Developer
- 2 languages: EN, ES
- Total: 6 PDFs stored in the repository

## Goals / Non-Goals

**Goals:**
- Generate 6 PDF resumes (3 profiles × 2 languages)
- Use YAML as single source of truth for profile data
- Python script converts YAML to LaTeX .tex files
- Profile-specific sidebars (skills, certifications)
- Translation support for UI labels

**Non-Goals:**
- Dynamic/runtime generation (pre-generated files only)
- Supporting more than 2 languages initially
- CI/CD-only generation (PDFs committed to repo)

## Decisions

### D1: Pre-generated .tex files (one per profile-language)

**Decision:** Create 6 separate .tex files: `resume-ai-architect-en.tex`, `resume-ai-architect-es.tex`, etc.

**Rationale:** Simpler than runtime variable substitution in LaTeX. Easier to version control and debug.

**Alternative considered:** Single .tex with ifthenelse for profile/language → More complex LaTeX, harder to maintain

### D2: YAML data structure with Python converter

**Decision:** Use YAML files in `data/profiles/`, `data/experience/`, `data/sidebars/` + Python script to convert to .tex

**Rationale:** YAML is human-readable, easy to edit, PyYAML is well-supported. Python is already available in the project (via uv).

**Alternative considered:** LuaLaTeX with lua-yaml → More complex setup, less familiar to team

### D3: Separate .tex files for each sidebar content

**Decision:** Instead of template-based generation, copy/generate full sidebar .tex files per profile

**Rationale:** LaTeX commands are simpler, no complex template engine needed

**Alternative considered:** Jinja2 templates → Adds dependency, overkill for this use case

### D4: All 6 PDFs committed to repository

**Decision:** Generate and commit all 6 PDFs to the repo

**Rationale:** Simplifies CI/CD, allows offline access, no build required to view

**Alternative considered:** Generate only in CI/CD → Requires build to review changes

## Data Structure

```
data/
├── profiles/
│   ├── ai-architect.yml
│   ├── cloud-architect.yml
│   └── golang-developer.yml
├── experience/
│   ├── ai-architect.yml
│   ├── cloud-architect.yml
│   └── golang-developer.yml
├── sidebars/
│   ├── ai-architect/
│   │   ├── skills.tex
│   │   ├── certifications.tex
│   │   └── ...
│   ├── cloud-architect/
│   └── golang-developer/
└── translations/
    ├── en.yml
    └── es.yml
```

## Python Converter Design

```python
# scripts/generate_resume.py
import yaml
import argparse

def generate_resume(profile: str, lang: str) -> None:
    # 1. Load profile metadata
    # 2. Load experience (filtered by emphasis)
    # 3. Load sidebar content for profile
    # 4. Load translations
    # 5. Render to .tex
    # 6. Run xelatex
```

## Migration Plan

1. Create `data/` directory structure with YAML files
2. Create `scripts/generate_resume.py`
3. Update `Taskfile.yml` with tasks:
   - `resume:profile LANG=es` - generate specific profile
   - `resume:all` - generate all 6 PDFs
4. Generate all 6 .tex files
5. Run xelatex to generate 6 PDFs
6. Commit all files
7. Deprecate old `resume.tex` (keep as reference or remove)

## Risks / Trade-offs

- **[Risk]** Maintaining 6 PDFs in sync → **Mitigation**: Single YAML source, Python regenerates all
- **[Risk]** Duplication of common content → **Mitigation**: Shared data in YAML, generation is automated
- **[Risk]** Build time (6 xelatex runs) → **Mitigation**: Acceptable for CI/CD, can parallelize

## Open Questions

- Should the old `resume.tex` be removed or kept as a reference?
- How to handle profile-specific experience emphasis in detail?