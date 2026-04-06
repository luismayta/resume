## ADDED Requirements

### Requirement: AI Platform Engineer profile exists
The system SHALL include a new resume profile named "ai-platform-engineer" in the profiles directory at `src/data/profiles/ai-platform-engineer.yml`.

#### Scenario: Profile file exists
- **WHEN** the profile generator is invoked with profile=ai-platform-engineer
- **THEN** the file `src/data/profiles/ai-platform-engineer.yml` exists and is parseable

#### Scenario: Profile has required fields
- **WHEN** the profile YAML is loaded
- **THEN** it contains fields: name, title, summary, contact (email, location, linkedin, github)

### Requirement: Profile renders to PDF
The system SHALL generate a valid PDF resume for the ai-platform-engineer profile.

#### Scenario: English PDF generation
- **WHEN** `task resume:profile PROFILE=ai-platform-engineer LANG=en` is executed
- **THEN** a PDF file is created at `src/resumes/resume-ai-platform-engineer-en.pdf`

#### Scenario: Spanish PDF generation
- **WHEN** `task resume:profile PROFILE=ai-platform-engineer LANG=es` is executed
- **THEN** a PDF file is created at `src/resumes/resume-ai-platform-engineer-es.pdf`

### Requirement: Profile appears in build all
The ai-platform-engineer profile SHALL be included when generating all resumes.

#### Scenario: Build all includes new profile
- **WHEN** `task resume:all` is executed
- **THEN** the output includes `resume-ai-platform-engineer-en.pdf` and `resume-ai-platform-engineer-es.pdf`