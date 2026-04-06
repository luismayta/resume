## Why

Create a new resume profile for "AI-Driven Platform Engineer" to showcase expertise in MLOps, AI infrastructure, and cloud platform engineering. This profile targets senior-level roles (5-10 years experience) combining hybrid skills in ML infrastructure, AI product development, and platform engineering. Having both English and Spanish versions will maximize reach across job markets.

## What Changes

- Create new profile `ai-platform-engineer` in `src/data/profiles/`
- Create YAML data files for experience, education, certifications
- Generate LaTeX resumes for English and Spanish versions
- Add new sidebar content (skills, certifications specific to AI platform role)
- Integrate into existing build system (Taskfile.yml)

## Capabilities

### New Capabilities
- `ai-platform-engineer-profile`: New resume profile with hybrid AI/Platform skills
- `ai-platform-engineer-experience`: Work history highlighting MLOps and platform engineering roles
- `ai-platform-engineer-sidebar`: Technical skills, certifications, and education for this profile
- `multi-language-resumes`: Support for English and Spanish versions

### Modified Capabilities
- None - this is a completely new profile adding to existing capabilities

## Impact

- **New Files**: `src/data/profiles/ai-platform-engineer.yml`, `src/data/experience/ai-platform-engineer.yml`, sidebar files
- **Modified Files**: `Taskfile.yml` (new build targets), existing resume generation scripts
- **Dependencies**: PyYAML for data parsing, XeLaTeX for PDF generation, existing template system