## ADDED Requirements

### Requirement: Profile metadata structure
The system SHALL store profile metadata in YAML files under `data/profiles/` containing profile ID, display name, tagline (EN/ES), and optional emphasis tags.

#### Scenario: Load AI architect profile
- **WHEN** profile "ai-architect" is requested
- **THEN** system loads `data/profiles/ai-architect.yml` with all metadata fields

### Requirement: Experience emphasis per profile
The system SHALL store experience entries in `data/experience/` with company, role (EN/ES), period, and emphasis tags that filter which achievements are highlighted per profile.

#### Scenario: Filter experience by emphasis
- **WHEN** experience entry has emphasis "mcp-server,rag-pipelines"
- **AND** profile requests emphasis "mcp-server"
- **THEN** that experience entry is included with relevant achievements

### Requirement: Sidebar content association
The system SHALL associate sidebar content (skills, certifications) with specific profiles, allowing different sidebar content per profile.

#### Scenario: Load profile-specific skills
- **WHEN** profile "cloud-architect" is requested
- **THEN** system loads sidebar content from `data/sidebars/cloud-architect/skills.tex`