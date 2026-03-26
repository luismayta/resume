## ADDED Requirements

### Requirement: LaTeX source files in src/ directory
All LaTeX source files SHALL be located in the `src/` directory structure.

#### Scenario: Directory structure after reorganization
- **WHEN** user views project root after reorganization
- **THEN** `src/` folder contains: `core/`, `config/`, `sections/`, `sidebars/`, `styles/`, `data/`, `resumes/`

#### Scenario: Resume files in src/resumes/
- **WHEN** user lists files in `src/resumes/`
- **THEN** files include: `resume.tex`, `page1sidebar.tex`, `page2sidebar.tex`, etc.

### Requirement: Generated resumes in src/resumes/
The Python generator SHALL output .tex files to `src/resumes/` directory.

#### Scenario: Generate resume
- **WHEN** user runs `task resume:profile PROFILE=ai-architect LANG=en`
- **THEN** `src/resumes/resume-ai-architect-en.tex` is created

### Requirement: Build output in build/
The LaTeX compilation SHALL output PDF to `build/` directory.

#### Scenario: Compile PDF
- **WHEN** user runs `task resume:profile`
- **THEN** PDF is created at `build/resume-ai-architect-en.pdf`