## ADDED Requirements

### Requirement: Experience data exists for ai-platform-engineer
The system SHALL have experience data specific to AI Platform Engineer roles.

#### Scenario: Experience file exists
- **WHEN** the resume generator loads profile data
- **THEN** `src/data/experience/ai-platform-engineer.yml` exists and contains work history

#### Scenario: Experience emphasizes MLOps and Platform Engineering
- **WHEN** the experience data is parsed
- **THEN** at least 60% of work history entries relate to MLOps, AI infrastructure, or Platform Engineering

### Requirement: Experience shows progression
The experience data SHALL show career progression from technical roles to senior/lead positions.

#### Scenario: Timeline is present
- **WHEN** experience is rendered
- **THEN** work history shows roles spanning at least 5 years

#### Scenario: Leadership is evident
- **WHEN** experience entries are reviewed
- **THEN** at least one role includes team lead, tech lead, or architecture responsibilities

### Requirement: Experience is translatable
The experience content SHALL support both English and Spanish translations.

#### Scenario: Both language versions exist
- **WHEN** English resume is generated
- **THEN** the Spanish version (`es`) also generates with translated role titles and descriptions