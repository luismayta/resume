## Why

Currently, the resume system supports only a single profile (AI Platform Architect) in English. To support multiple professional profiles (AI Architect, Cloud Architect, Golang Developer) in two languages (EN, ES), we need a structured system that can generate 6 different PDFs from a common data source. This enables targeted resumes for different roles without duplicating content.

## What Changes

- Create a YAML-based data structure to store profile-specific content (personal info, experience emphasis, skills, certifications)
- Build a Python script to convert YAML data into LaTeX files
- Generate 6 pre-built resume files: `resume-{profile}-{lang}.tex` for each profile-language combination
- Add Taskfile tasks to build specific profiles or all 6 PDFs
- Restructure sidebars to support profile-specific content
- Add translation support for UI labels

## Capabilities

### New Capabilities

- `multi-profile-data`: YAML-based data layer storing profile metadata, experience emphasis, and sidebar content per profile
- `profile-generator`: Python script that reads YAML and generates LaTeX .tex files
- `multi-language-support`: Translation system for UI labels (section titles, headers)
- `profile-specific-sidebars`: Sidebar content that varies by profile (skills, certifications)

### Modified Capabilities

- (none - this is a new system)

## Impact

- New directory structure: `data/profiles/`, `data/experience/`, `data/sidebars/`, `data/translations/`
- New scripts: Python converter and Taskfile tasks
- Output: 6 PDF files committed to the repository
- Dependencies: PyYAML added to project