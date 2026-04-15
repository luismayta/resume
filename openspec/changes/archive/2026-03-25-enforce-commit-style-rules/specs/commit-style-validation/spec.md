## ADDED Requirements

### Requirement: Commit message validation
The system SHALL validate commit messages against the goji format defined in infobot.toml before allowing commits.

#### Scenario: Valid commit message
- **WHEN** a developer makes a commit with format `<type> <emoji> (<scope>): <subject>`
- **THEN** the commit is allowed and passes validation

#### Scenario: Invalid commit message - missing type
- **WHEN** a developer makes a commit without a type prefix (e.g., "add new feature")
- **THEN** the commit is rejected with an error message showing valid types

#### Scenario: Invalid commit message - invalid type
- **WHEN** a developer makes a commit with an invalid type (e.g., "foo: add feature")
- **THEN** the commit is rejected showing allowed types: feat, fix, docs, chore, refactor, style, test

#### Scenario: Valid commit with issue reference
- **WHEN** a developer makes a commit like "feat (core): add new feature (#123)"
- **THEN** the commit is allowed and passes validation

### Requirement: Signoff validation
The system SHALL require signoff (Signed-off-by) in commit messages when enabled in configuration.

#### Scenario: Commit with signoff
- **WHEN** a developer makes a commit with "Signed-off-by: Name <email>"
- **THEN** the commit is allowed

#### Scenario: Commit without signoff (when signoff required)
- **WHEN** a developer makes a commit without signoff and signoff is required
- **THEN** the commit is rejected with a message about required signoff