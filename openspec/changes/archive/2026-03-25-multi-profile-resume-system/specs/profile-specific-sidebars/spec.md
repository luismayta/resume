## ADDED Requirements

### Requirement: Profile-specific skills
The system SHALL generate different skills content based on the profile, where AI Architect shows ML/AI skills, Cloud Architect shows cloud/infrastructure skills, and Golang Developer shows programming skills.

#### Scenario: AI Architect skills
- **WHEN** profile "ai-architect" is requested
- **THEN** generated skills include: MCP, LLM Orchestration, RAG, Vector Search

#### Scenario: Cloud Architect skills
- **WHEN** profile "cloud-architect" is requested
- **THEN** generated skills include: AWS, Kubernetes, Terraform, Networking

### Requirement: Profile-specific certifications
The system SHALL generate different certifications based on the profile.

#### Scenario: Golang Developer certifications
- **WHEN** profile "golang-developer" is requested
- **THEN** certifications emphasize Go-related certifications

### Requirement: Shared sidebar content
The system SHALL use shared content for education and languages (same across all profiles).

#### Scenario: Education content
- **WHEN** any profile is requested
- **THEN** education section is loaded from shared location and is identical across profiles