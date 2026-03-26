## ADDED Requirements

### Requirement: LaTeX artifacts generated in build directory
The LaTeX build system SHALL output all generated artifacts to a `build/` directory instead of the project root.

#### Scenario: Compile resume with Taskfile
- **WHEN** user runs `task resume` or `task xelatex:resume`
- **THEN** all generated files (.aux, .bcf, .log, .out, .pdf, .run.xml) are created in the `build/` directory

#### Scenario: Git ignore includes build artifacts
- **WHEN** user runs `git status` after building
- **THEN** no files from `build/` directory appear as untracked

### Requirement: Generated PDF accessible from build directory
The compiled PDF SHALL be accessible at `build/resume.pdf` (or `build/resume-<profile>.pdf` for specific profiles).

#### Scenario: PDF file exists after build
- **WHEN** LaTeX compilation completes successfully
- **THEN** `build/resume.pdf` file exists and is a valid PDF

#### Scenario: Profile-specific PDF generation
- **WHEN** user runs `task resume:ai-architect` or similar profile task
- **THEN** the generated PDF is placed in `build/resume-ai-architect.pdf`