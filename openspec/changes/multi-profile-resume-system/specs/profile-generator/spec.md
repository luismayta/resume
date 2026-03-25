## ADDED Requirements

### Requirement: Python converter script
The system SHALL provide a Python script (`scripts/generate_resume.py`) that reads YAML data and generates LaTeX .tex files.

#### Scenario: Generate single resume
- **WHEN** script is called with `--profile ai-architect --lang es`
- **THEN** script generates `resume-ai-architect-es.tex` in the project root

### Requirement: YAML to LaTeX conversion
The converter SHALL transform YAML data structures into valid LaTeX commands including `\name{}`, `\tagline{}`, `\cvexperience{}`, `\cvskill{}`, and `\cvcert{}`.

#### Scenario: Convert profile tagline
- **WHEN** YAML contains `tagline_es: "Arquitecto de Plataformas AI"`
- **THEN** generated .tex contains `\tagline{Arquitecto de Plataformas AI | ...}`

### Requirement: Generate all profiles
The converter SHALL support generating all profiles and languages in a single run.

#### Scenario: Generate all 6 resumes
- **WHEN** script is called with `--all`
- **THEN** script generates all 6 .tex files: ai-architect-en/es, cloud-architect-en/es, golang-developer-en/es