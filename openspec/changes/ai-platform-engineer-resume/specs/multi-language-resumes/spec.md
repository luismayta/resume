## ADDED Requirements

### Requirement: English resume exists for ai-platform-engineer
The system SHALL generate an English version of the ai-platform-engineer resume.

#### Scenario: English profile loads correctly
- **WHEN** LANG=en is specified
- **THEN** the resume renders with English content for all fields

#### Scenario: English PDF is valid
- **WHEN** PDF generation completes
- **THEN** the output PDF is readable and contains all sections

### Requirement: Spanish resume exists for ai-platform-engineer
The system SHALL generate a Spanish version of the ai-platform-engineer resume.

#### Scenario: Spanish profile loads correctly
- **WHEN** LANG=es is specified
- **THEN** the resume renders with Spanish content for all fields

#### Scenario: Spanish PDF is valid
- **WHEN** PDF generation completes
- **THEN** the output PDF is readable and contains all sections

### Requirement: Both languages use same structure
The English and Spanish versions SHALL share identical LaTeX template structure.

#### Scenario: Template consistency
- **WHEN** both language versions are compared
- **THEN** they have the same sections, layout, and visual style

#### Scenario: Translation completeness
- **WHEN** both versions are reviewed
- **THEN** all visible text is translated (no mixed language content)